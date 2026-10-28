/*
  VoChop - AI words (Node for Max, runs inside [node.script])
  Offline speech recognition with sherpa-onnx + NVIDIA Parakeet TDT 0.6B v3 (int8):
  25 European languages incl. Croatian and English, detected automatically.
  Receives 16 kHz audio from vochop.js, returns every word with its onset time.
  The model (~670 MB) is downloaded once on first use. Nothing leaves your computer.
*/
const path = require("path");
const fs = require("fs");
const https = require("https");

let maxApi;
try { maxApi = require("max-api"); } catch (e) { maxApi = null; }   // allows testing outside Max

const DIR = __dirname;
const MODEL_DIR = path.join(DIR, "vochop_asr_model_v3");
const HF = "https://huggingface.co/csukuangfj/sherpa-onnx-nemo-parakeet-tdt-0.6b-v3-int8/resolve/main/";
const FILES = ["encoder.int8.onnx", "decoder.int8.onnx", "joiner.int8.onnx", "tokens.txt"];

let recognizer = null;
let samples = [];
let curId = 0;

function out(...a) { if (maxApi) maxApi.outlet(...a); else console.log(a.join(" ")); }
function status(st, msg) { out("asrstatus", st, msg || ""); }

function download(url, dest, redirects = 0) {
  return new Promise((resolve, reject) => {
    const req = https.get(url, { headers: { "User-Agent": "VoChop" } }, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location && redirects < 8) {
        res.resume();
        const next = new URL(res.headers.location, url).toString();
        return resolve(download(next, dest, redirects + 1));
      }
      if (res.statusCode !== 200) { res.resume(); return reject(new Error("HTTP " + res.statusCode)); }
      const tmp = dest + ".part";
      const f = fs.createWriteStream(tmp);
      const total = Number(res.headers["content-length"]) || 0;
      let got = 0, lastPct = -1;
      res.on("data", (c) => {
        got += c.length;
        const pct = total ? Math.floor(got / total * 100) : -1;
        if (total > 5e6 && pct != lastPct && pct % 5 == 0) { lastPct = pct; status("info", "downloading speech model " + pct + "% (one time, ~670 MB)"); }
      });
      const fail = (e) => { res.unpipe(f); f.destroy(); try { fs.unlinkSync(tmp); } catch (x) { } reject(e); };
      res.on("error", fail);
      res.on("aborted", () => fail(new Error("download interrupted")));
      f.on("error", fail);
      res.pipe(f);
      // rename only a complete file, so a dropped connection is retried next time
      f.on("finish", () => f.close(() => {
        if (total && got !== total) return fail(new Error("download incomplete (" + got + "/" + total + " bytes)"));
        fs.renameSync(tmp, dest); resolve();
      }));
    });
    req.setTimeout(60000, () => req.destroy(new Error("download stalled")));
    req.on("error", reject);
  });
}

async function ensureModel() {
  if (!fs.existsSync(MODEL_DIR)) fs.mkdirSync(MODEL_DIR, { recursive: true });
  for (const f of FILES) {
    const p = path.join(MODEL_DIR, f);
    if (fs.existsSync(p) && fs.statSync(p).size > 1000) continue;
    status("info", "downloading model file " + f + " ...");
    await download(HF + f, p);
  }
}

let reportedMissing = false;
async function boot() {
  let sherpa;
  try {
    sherpa = require("sherpa-onnx-node");
  } catch (e) {
    // not installed yet: tell VoChop once, then keep checking quietly
    // (VoChop runs "npm install" for us when AI WORDS is switched on)
    if (!reportedMissing) status("missing", "speech engine not installed");
    reportedMissing = true;
    setTimeout(boot, 5000);
    return;
  }
  try {
    await ensureModel();
    const M = MODEL_DIR + path.sep;
    recognizer = new sherpa.OfflineRecognizer({
      featConfig: { sampleRate: 16000, featureDim: 80 },
      modelConfig: {
        transducer: {
          encoder: M + FILES[0],
          decoder: M + FILES[1],
          joiner: M + FILES[2],
        },
        tokens: M + FILES[3],
        modelType: "nemo_transducer",
        numThreads: 4,
        provider: "cpu",
        debug: 0,
      },
    });
    status("ready", "offline multilingual model loaded (hr, en, de, ...)");
  } catch (e) {
    status("error", String(e && e.message ? e.message : e).slice(0, 120));
  }
}

// group BPE tokens into words; token times are word onsets (+-60 ms)
function toWords(r, offset) {
  const words = [];
  for (let i = 0; i < r.tokens.length; i++) {
    const t = r.tokens[i];
    const ts = r.timestamps[i] - offset;
    const clean = t.replace(/^[\s▁]+/, "");
    const isStart = /^[\s▁]/.test(t) || !words.length;
    if (isStart) words.push({ w: clean, t: ts, l: ts });
    else { words[words.length - 1].w += clean; words[words.length - 1].l = ts; }
  }
  return words.map((w) => ({ w: w.w.replace(/[^\p{L}\p{N}']/gu, ""), t: w.t, l: w.l })).filter((w) => w.w.length > 0);
}

function recognize(audio, rate) {
  const pre = 0.3, post = 0.6;                       // padding helps the last word
  const buf = new Float32Array(Math.round(pre * rate) + audio.length + Math.round(post * rate));
  buf.set(audio, Math.round(pre * rate));
  const stream = recognizer.createStream();
  stream.acceptWaveform({ samples: buf, sampleRate: rate });
  recognizer.decode(stream);
  return toWords(recognizer.getResult(stream), pre);
}

function handleBegin(id) { curId = Number(id); samples = []; }
function handleChunk(...vals) { for (const v of vals) samples.push(Number(v) || 0); }
function handleGo(id, rate) {
  id = Number(id);
  if (id !== curId) return;
  if (!recognizer) { status("error", "engine not ready"); return; }
  try {
    status("busy");
    const t0 = Date.now();
    const words = recognize(Float32Array.from(samples), Number(rate) || 16000);
    const flat = [];
    for (const w of words) flat.push(Math.round(w.t * 1000) / 1000, Math.round(w.l * 1000) / 1000, w.w);
    out("asrwords", id, ...flat);
    status("ready", words.length + " words in " + (Date.now() - t0) + " ms");
  } catch (e) {
    status("error", String(e && e.message ? e.message : e).slice(0, 120));
  }
}

if (maxApi) {
  maxApi.addHandler("asrbegin", handleBegin);
  maxApi.addHandler("asrchunk", handleChunk);
  maxApi.addHandler("asrgo", handleGo);
  maxApi.addHandler("retry", () => { if (!recognizer) boot(); });
  boot();
}

module.exports = { boot, download, recognize, toWords, handleBegin, handleChunk, handleGo,
                   _setRecognizer: (r) => { recognizer = r; } };
