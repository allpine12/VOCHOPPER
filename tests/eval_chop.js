/*
  Chop accuracy on a test corpus:  node tests/eval_chop.js <corpus-dir> [key=value ...]
  corpus-dir/meta.json: [{file, words, truth:[[s,e],...] | null, truth from asr_truth.json for natural speech}]
  AI=1 uses asr_words.json (speech recognition word onsets) like AI WORDS does
  key=value overrides engine params (P.*) or chop constants (T.*), e.g. wsens=60 T.maxSylLo=3
*/
const path = require("path"), fs = require("fs");
const { load, readWav } = require("./maxmock");
const dir = process.argv[2];
const meta = JSON.parse(fs.readFileSync(path.join(dir, "meta.json")));
let asrTruth = {}, asrWords = {};
try { asrWords = JSON.parse(fs.readFileSync(path.join(dir, "asr_words.json"))); } catch (e) { }
try { asrTruth = JSON.parse(fs.readFileSync(path.join(dir, "asr_truth.json"))); } catch (e) { }
const { ctx } = load(path.join(__dirname, "..", "vochop.js"));
for (const kv of process.argv.slice(3)) {
  const [k, v] = kv.split("=");
  if (k.startsWith("T.")) ctx.T[k.slice(2)] = Number(v); else ctx.P[k] = Number(v);
}
const TOL = 0.06;
let tp = 0, fp = 0, fn = 0, cntErr = 0, n = 0, onsetErr = [], rows = [];
for (const m of meta) {
  const w = readWav(path.join(dir, m.file));
  let truth = m.truth;
  if (!truth && asrTruth[m.file]) truth = asrTruth[m.file];
  if (!truth) continue;
  ctx.setAudio(w.x, w.sr);
  ctx.recLen = 0;
  ctx.readFeatures();
  if (process.env.AI && asrWords[m.file]) { ctx.P.ai = 1; ctx.asrList = asrWords[m.file].map((x) => ({ t: x.t, l: x.l, w: x.w.toLowerCase() })); }
  ctx.segment();
  const pred = ctx.words.map((x) => [x.s / w.sr, x.e / w.sr]);
  const tr = truth.map((x) => [x[0] / w.sr, x[1] / w.sr]);
  // boundaries between words = starts of words 2..N
  const pb = pred.slice(1).map((x) => x[0]), tb = tr.slice(1).map((x) => x[0]);
  const tol = m.kind == "full" ? 0.1 : TOL;
  const used = new Set(); let hit = 0;
  for (const b of pb) { let j = tb.findIndex((t, k) => !used.has(k) && Math.abs(t - b) <= tol); if (j >= 0) { used.add(j); hit++; } }
  tp += hit; fp += pb.length - hit; fn += tb.length - hit;
  cntErr += Math.abs(pred.length - tr.length); n++;
  if (m.kind == "join" && pred.length) onsetErr.push((pred[0][0] - tr[0][0]) * 1000);
  const parts = ctx.words.map((x) => x.np).join("");
  rows.push(`${m.file.padEnd(14)} words ${String(pred.length).padStart(2)}/${String(tr.length).padEnd(2)} hit ${hit}/${tb.length}  parts ${parts}`);
}
const P = tp / Math.max(1, tp + fp), R = tp / Math.max(1, tp + fn), F1 = 2 * P * R / Math.max(1e-9, P + R);
if (process.env.V) console.log(rows.join("\n"));
onsetErr.sort((a, b) => a - b);
console.log(`F1 ${F1.toFixed(3)}  P ${P.toFixed(3)} R ${R.toFixed(3)}  count err/phrase ${(cntErr / n).toFixed(2)}  ` +
  `onset err ms (min/med/max) ${onsetErr.length ? [onsetErr[0], onsetErr[onsetErr.length >> 1], onsetErr[onsetErr.length - 1]].map((v) => v.toFixed(0)).join("/") : "-"}`);
