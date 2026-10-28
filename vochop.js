/*
  VoChop - main engine  (Max for Live [js], ES5)
  ------------------------------------------------
  - reads the recorded phrase from buffer~
  - chops it into WORDS (pauses + deep energy valleys) and
    PARTS / syllables (Mermelstein-style loudness-hull valleys)
  - detects the pitch of every slice (YIN) for Keys/Tune/Snap
  - maps slices onto an 8x8 pad grid (Push 3 / any MIDI keyboard / mouse)
  - 8-voice polyphonic playback, effects control, takes, MIDI clip export
*/

autowatch = 0;
inlets = 1;
outlets = 3;
setinletassist(0, "messages");
setoutletassist(0, "to voices");
setoutletassist(1, "to UI (grid / big view / push)");
setoutletassist(2, "to patch (buffer, bus, fx, params, state)");

var me = this;
var BUF = (jsarguments.length > 1) ? String(jsarguments[1]) : "vochop_buf";
var NV = 8;
var MAXREC_MS = 60000;
var NBINS = 420;

// ---------------------------------------------------------------- params
var P = {
    mode: 0,      // 0 Words+Parts, 1 Syllables, 2 Word list, 3 Keys
    trig: 0,      // 0 One-shot, 1 Gate, 2 Loop
    pitch: 0, attack: 2, release: 120, spread: 30, poly: 8, vel: 70,
    stutter: 0, reverse: 0, snap: 0, tune: 1, choke: 0,
    wsens: 50, ssens: 50, base: 36, link: 1,
    ftype: 0, cutoff: 20000, reso: 10, crush: 0, drive: 0,
    delay: 0, dtime: 2, fdbk: 40, reverb: 0, size: 60,
    ai: 0         // AI WORDS: speech recognition decides word boundaries
};
// chopping constants (tuned on test phrases; sensitivity knobs move around these)
var T = { gapHi: 260, gapLo: 40, wThrHi: 24, wThrLo: 7, minWHi: 150, minWLo: 70, sThrHi: 9, sThrLo: 1.5,
          minSHi: 120, minSLo: 45, vowelDb: 18, minWordMs: 90 };
var MODE_NAMES = ["Words + Parts", "Syllables", "Word List", "Keys"];
var STUTTER_BEATS = [0, 1, 0.5, 0.25, 0.125, 1 / 3, 1 / 6];
var DTIME_BEATS = [0.25, 1 / 3, 0.5, 0.75, 1, 1.5, 2];
var NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];

// ---------------------------------------------------------------- state
var ready = 0, bootT = 0;
var sr = 44100, nFrames = 0, recLen = 0, normGain = 1;
var feat = null, waveBins = [];
var words = [], phrase = null;
var pads = [], keySlice = null;
var voices = [];
var recording = 0, waitingDone = 0, recStartT = 0, recStopT = 0;
var pendingLoad = 0, inputSeen = 0, learning = 0;
var takes = [], takeIdx = -1, lastState = "";
var tempo = 120, scaleRoot = 0, scaleInts = [0, 2, 4, 5, 7, 9, 11];
var bendSemis = 0, tempoApi = null;
var asrList = null, asrId = 0, asrState = "off", asr16 = [];   // AI words

var i;
for (i = 0; i < 64; i++) pads[i] = null;
for (i = 0; i < NV; i++) voices[i] = { busy: 0, note: -1, held: 0, t: 0, relT: 0, loop: 0, dur: 0, pad: -1, args: null };

var recTask = new Task(function () { stopRecording(); }, this);
var doneTask = new Task(function () { if (waitingDone) recdone(-1); }, this);
var rechopTask = new Task(function () { if (feat) { segment(); buildPads(); sendUI(); summary(); } }, this);
var hitTasks = {};

// ---------------------------------------------------------------- utils
function clamp(v, a, b) { return v < a ? a : (v > b ? b : v); }
function lerp(a, b, t) { return a + (b - a) * t; }
function now() { return new Date().getTime(); }
function setStatus(s) { outlet(1, "status", String(s)); }
function setInfo(s) { outlet(1, "info", String(s)); }
function noteName(n) { n = Math.round(n); return NOTE_NAMES[((n % 12) + 12) % 12] + (Math.floor(n / 12) - 2); }
function fmtSec(samps) { return (samps / sr).toFixed(2) + "s"; }

// ---------------------------------------------------------------- boot
function init() {
    ready = 0;
    bootT = now();
}

function start() {
    ready = 1;
    bootT = now();
    try {
        tempoApi = new LiveAPI(onTempo, "live_set");
        tempoApi.property = "tempo";
        var t = tempoApi.get("tempo");
        if (t && t.length && t[0] > 0) tempo = Number(t[0]);
    } catch (e) { post("VoChop: tempo api failed\n"); }
    refreshScale();
    announce();
    updateFx();
    outlet(1, "mode", P.mode);
    outlet(1, "base", P.base);
    if (!words.length && !pendingLoad) setStatus("Press REC (VoChop Input on mic track) or drop audio");
    sendUI();
}

function onTempo(a) {
    if (a && a[0] == "tempo" && a.length > 1 && Number(a[1]) > 0) {
        tempo = Number(a[1]);
        updateFx();
    }
}

function refreshScale() {
    try {
        var s = new LiveAPI(null, "live_set");
        var r = s.get("root_note");
        var iv = s.get("scale_intervals");
        if (r && r.length && !isNaN(Number(r[0]))) scaleRoot = Number(r[0]);
        if (iv && iv.length) {
            var out = [];
            for (var k = 0; k < iv.length; k++) { var v = Number(iv[k]); if (!isNaN(v)) out.push(v); }
            if (out.length) scaleInts = out;
        }
    } catch (e) { /* Live < 12: keep major scale */ }
}

function announce() {
    outlet(2, "bus", P.link, "buf", BUF);
}

// ---------------------------------------------------------------- params in
function p(name, v) {
    P[name] = Number(v);
    switch (name) {
        case "mode":
            buildPads(); sendUI(); outlet(1, "mode", P.mode);
            setInfo(MODE_NAMES[P.mode] || "");
            break;
        case "wsens": case "ssens":
            rechopTask.cancel(); rechopTask.schedule(120);
            break;
        case "snap":
            refreshScale(); computeTunes();
            break;
        case "base":
            outlet(1, "base", P.base); sendUI();
            break;
        case "ai":
            if (P.ai) {
                if (asrState == "ready") { if (feat) sendAsr(); else setStatus("AI words on - record a phrase"); }
                else if (asrState == "missing" || asrState == "error") installAsr();
                else { setStatus("AI words: starting speech engine..."); aistart(); }
            } else if (feat) { asrList = null; segment(); buildPads(); sendUI(); summary(); }
            break;
        case "link":
            inputSeen = 0; announce();
            break;
        case "ftype": case "cutoff": case "reso": case "crush": case "drive":
        case "delay": case "dtime": case "fdbk": case "reverb": case "size":
            updateFx();
            break;
    }
}

function updateFx() {
    outlet(2, "fx", "ftype", clamp(Math.round(P.ftype), 0, 3) + 1);
    outlet(2, "fx", "cut", clamp(P.cutoff, 20, 20000), 30);
    outlet(2, "fx", "res", clamp(P.reso / 100, 0, 1) * 0.96);
    var c = clamp(P.crush / 100, 0, 1);
    outlet(2, "fx", "crsr", 1 - 0.97 * Math.pow(c, 0.8));
    outlet(2, "fx", "crbits", Math.round(24 - 20 * c));
    var d = clamp(P.drive / 100, 0, 1);
    var g = 0.3 + d * d * 14;
    outlet(2, "fx", "drv", g);
    outlet(2, "fx", "mku", (1 / Math.tanh(g)) * (1 - 0.35 * d));
    outlet(2, "fx", "dsend", clamp(P.delay / 100, 0, 1));
    var beat = 60000 / clamp(tempo, 20, 999);
    outlet(2, "fx", "dtime", clamp(beat * DTIME_BEATS[clamp(Math.round(P.dtime), 0, 6)], 5, 3900));
    outlet(2, "fx", "fb", clamp(P.fdbk / 100, 0, 0.95));
    outlet(2, "fx", "rmix", clamp(P.reverb / 100, 0, 1) * 0.4);
    outlet(2, "fx", "rsize", 0.70 + clamp(P.size / 100, 0, 1) * 0.27);
}

// ---------------------------------------------------------------- buttons
function learn(v) {
    if (v === 0) return;
    learning = 1;
    setStatus("LEARN: press the bottom-left pad on Push");
}

function rec(v) {
    v = Number(v);
    if (!ready || now() - bootT < 1500) { outlet(2, "setrec", recording); return; }
    if (v > 0) startRecording(); else stopRecording();
}

function takeprev(v) { if (v === 0) return; if (takeIdx > 0) loadTake(takeIdx - 1); else setStatus("No earlier take"); }
function takenext(v) { if (v === 0) return; if (takeIdx < takes.length - 1) loadTake(takeIdx + 1); else setStatus("No later take"); }

function bend(v) {
    bendSemis = ((Number(v) - 64) / 64) * 2;
}

// ---------------------------------------------------------------- inter-device bus
function busin() {
    var a = arrayfromargs(arguments);
    if (a.length < 2 || Number(a[0]) != P.link) return;
    var cmd = String(a[1]);
    if (cmd == "hello") {
        inputSeen = 1; announce();
    } else if (cmd == "recreq") {
        inputSeen = 1;
        if (Number(a[2]) > 0) startRecording(); else stopRecording();
    } else if (cmd == "recdone") {
        recdone(Number(a[2]));
    }
}

// ---------------------------------------------------------------- recording
function startRecording() {
    if (recording) return;
    if (waitingDone) return;
    allNotesOff();
    recording = 1;
    recStartT = now();
    outlet(2, "buf", "size", MAXREC_MS);
    outlet(2, "bus", P.link, "rec", 1, BUF);
    outlet(2, "setrec", 1);
    outlet(1, "rec", 1);
    if (inputSeen) setStatus("REC... speak now - press REC again to chop");
    else setStatus("REC... (no 'VoChop Input' heard on Link " + P.link + " yet - put it on your mic track)");
    recTask.cancel();
    recTask.schedule(MAXREC_MS - 200);
}

function stopRecording() {
    if (!recording) return;
    recording = 0;
    recStopT = now();
    recTask.cancel();
    waitingDone = 1;
    setStatus("Chopping...");
    doneTask.cancel();
    doneTask.schedule(700);
    outlet(2, "setrec", 0);
    outlet(1, "rec", 0);
    outlet(2, "bus", P.link, "rec", 0);
}

function recdone(frac) {
    if (!waitingDone) return;
    waitingDone = 0;
    doneTask.cancel();
    var b = new Buffer(BUF);
    var total = b.framecount();
    var lms = b.length();
    if (total <= 0 || lms <= 0) { setStatus("Buffer not ready"); return; }
    var bsr = total / (lms / 1000);
    var est = Math.round(((recStopT - recStartT) / 1000) * bsr);
    var n = (frac > 0 && frac <= 1) ? Math.round(frac * total) : est;
    if (n > total) n = total;
    if (n < bsr * 0.08) {
        if (!inputSeen && frac < 0) setStatus("Nothing recorded: add 'VoChop Input' to your mic track (Link " + P.link + ")");
        else setStatus("Recording too short - try again");
        return;
    }
    recLen = n;
    outlet(2, "buf", "crop", 0, (n / bsr) * 1000);
    outlet(2, "buf", "normalize", 0.9);
    analyzeAll();
    if (words.length) saveTake();
}

function saveTake() {
    var folder = deviceFolder();
    if (!folder) { post("VoChop: device has no file path - take not saved to disk\n"); return; }
    var d = new Date();
    function z(x) { return (x < 10 ? "0" : "") + x; }
    var name = "VoChop_take_" + d.getFullYear() + z(d.getMonth() + 1) + z(d.getDate()) + "_" +
        z(d.getHours()) + z(d.getMinutes()) + z(d.getSeconds()) + ".wav";
    var path = folder + name;
    outlet(2, "buf", "writewave", path);
    takes.push(path);
    while (takes.length > 16) takes.shift();
    takeIdx = takes.length - 1;
    storeState();
}

function deviceFolder() {
    var fp = "";
    try { fp = String(me.patcher.filepath || ""); } catch (e) { fp = ""; }
    if (!fp) return "";
    var k = fp.lastIndexOf("/");
    if (k < 0) return "";
    return fp.substring(0, k + 1);
}

// ---------------------------------------------------------------- takes / persistence
function storeState() {
    var a = ["pattr", takeIdx].concat(takes);
    lastState = a.slice(1).join("|");
    outlet(2, a);
}

function state() {
    var a = arrayfromargs(arguments);
    if (a.length < 2) return;
    var s = a.join("|");
    if (s == lastState) return;
    lastState = s;
    takes = [];
    for (var k = 1; k < a.length; k++) takes.push(String(a[k]));
    var idx = clamp(Math.round(Number(a[0])), 0, takes.length - 1);
    loadTake(idx);
}

function loadTake(idx) {
    if (idx < 0 || idx >= takes.length) return;
    takeIdx = idx;
    pendingLoad = 1;
    setStatus("Loading take " + (idx + 1) + "/" + takes.length + "...");
    outlet(2, "buf", "replace", takes[idx]);
    storeState();
}

function dropfile() {
    var a = arrayfromargs(arguments);
    var path = a.join(" ");
    if (!path) return;
    takes.push(path);
    while (takes.length > 16) takes.shift();
    loadTake(takes.length - 1);
}

function loaded() {
    if (!pendingLoad) return;
    pendingLoad = 0;
    recLen = 0;
    outlet(2, "buf", "normalize", 0.9);
    analyzeAll();
}

// ---------------------------------------------------------------- analysis
function analyzeAll() {
    var t0 = now();
    if (!readFeatures()) { setStatus("Could not read audio"); return; }
    segment();
    buildPads();
    sendWave();
    sendUI();
    summary(now() - t0);
    if (P.ai) { if (asrState == "ready") sendAsr(); else if (asrState == "missing") installAsr(); }
}

function summary(ms) {
    var parts = 0;
    for (var k = 0; k < words.length; k++) parts += Math.max(1, words[k].subs.length);
    var s = words.length + " words / " + parts + " parts  (" + fmtSec(nFrames) + ")";
    if (takes.length) s += "   take " + (takeIdx + 1) + "/" + takes.length;
    if (ms !== undefined) s += "   " + ms + " ms";
    if (!words.length) s = "No speech found - try lowering the input threshold or speak louder";
    setStatus(s);
}

function readFeatures() {
    var b = new Buffer(BUF);
    var total = b.framecount();
    var lms = b.length();
    if (!(total > 0) || !(lms > 0)) return false;
    sr = total / (lms / 1000);
    var n = (recLen > 0) ? Math.min(recLen, total) : total;
    nFrames = n;
    var normGuess = 1;
    var hop = Math.max(16, Math.round(sr * 0.005));
    var nf = Math.floor(n / hop);
    if (nf < 8) return false;

    var e = new Array(nf), bd = new Array(nf);
    var dt = 1 / sr;
    var rcDC = 1 / (2 * Math.PI * 40), aDC = rcDC / (rcDC + dt);
    var rcHP = 1 / (2 * Math.PI * 300), aHP = rcHP / (rcHP + dt);
    var rcLP = 1 / (2 * Math.PI * 3500), bLP = dt / (rcLP + dt);
    var xp = 0, yd = 0, hpY = 0, hpX = 0, lp = 0;
    var acc = 0, accB = 0, c = 0, f = 0, peak = 0;
    var bins = new Array(NBINS), bi = 0, nextBin = n / NBINS, binMax = 0;
    var CH = 8192, pos, j, cnt, arr, x, ax;
    var rs = 16000 / sr, rph = 0, lpA = 0, lpB = 0, bA = Math.min(1, (2 * Math.PI * 7000) / sr);
    asr16 = [];
    asrList = null;

    for (pos = 0; pos < n; pos += CH) {
        cnt = Math.min(CH, n - pos);
        arr = b.peek(1, pos, cnt);
        if (typeof arr == "number") arr = [arr];
        for (j = 0; j < cnt; j++) {
            x = arr[j];
            yd = aDC * (yd + x - xp); xp = x;
            ax = yd < 0 ? -yd : yd;
            if (ax > peak) peak = ax;
            if (ax > binMax) binMax = ax;
            if (pos + j >= nextBin) { if (bi < NBINS) bins[bi] = binMax; bi++; binMax = 0; nextBin = (bi + 1) * n / NBINS; }
            lpA += bA * (yd - lpA); lpB += bA * (lpA - lpB);
            rph += rs;
            if (rph >= 1) { rph -= 1; asr16.push(Math.round(lpB * normGuess * 32767) / 32767); }
            hpY = aHP * (hpY + yd - hpX); hpX = yd;
            lp += bLP * (hpY - lp);
            acc += yd * yd; accB += lp * lp;
            if (++c == hop) {
                if (f < nf) { e[f] = acc / hop; bd[f] = accB / hop; }
                f++; acc = 0; accB = 0; c = 0;
            }
        }
    }
    while (bi < NBINS) { bins[bi] = binMax; bi++; binMax = 0; }
    if (peak > 0.00001) { var sc = 0.9 / peak; for (j = 0; j < asr16.length; j++) asr16[j] = Math.round(asr16[j] * sc * 10000) / 10000; }

    normGain = peak > 0.00001 ? Math.min(8, 0.9 / peak) : 1;
    var eDb = smoothDb(e, 2), bDb = smoothDb(bd, 5);
    var sorted = eDb.slice(0).sort(function (a, z) { return a - z; });
    var floor = sorted[Math.floor(sorted.length * 0.08)];
    var top = sorted[Math.min(sorted.length - 1, Math.floor(sorted.length * 0.995))];
    var mx = 0.00001;
    for (j = 0; j < NBINS; j++) if (bins[j] > mx) mx = bins[j];
    waveBins = [];
    for (j = 0; j < NBINS; j++) waveBins.push(Math.round((bins[j] / mx) * 1000) / 1000);
    var bs = bDb.slice(0).sort(function (a, z) { return a - z; });
    var btop = bs[Math.min(bs.length - 1, Math.floor(bs.length * 0.995))];
    feat = { hop: hop, nf: nf, eDb: eDb, bDb: bDb, floor: floor, top: top, btop: btop };
    return true;
}

function smoothDb(a, rad) {
    var n = a.length, out = new Array(n), ps = new Array(n + 1), k;
    ps[0] = 0;
    for (k = 0; k < n; k++) ps[k + 1] = ps[k] + (a[k] || 0);
    for (k = 0; k < n; k++) {
        var lo = Math.max(0, k - rad), hi = Math.min(n, k + rad + 1);
        out[k] = 10 * Math.log((ps[hi] - ps[lo]) / (hi - lo) + 1e-12) / Math.LN10;
    }
    return out;
}

// Split [a,b) at the deepest valley below the "hull" min(maxLeft,maxRight);
// recursive.  Pushes split frame indices into out.
function hullSplit(cv, a, b, thr, minLen, out, depth) {
    if (depth > 40 || b - a < 2 * minLen) return;
    var lm = new Array(b - a), m = -1e9, k, best = -1, bestD = 0, h, d;
    for (k = a; k < b; k++) { if (cv[k] > m) m = cv[k]; lm[k - a] = m; }
    m = -1e9;
    for (k = b - 1; k >= a; k--) {
        if (cv[k] > m) m = cv[k];
        if (k - a < minLen || b - k < minLen) continue;
        h = Math.min(lm[k - a], m);
        d = h - cv[k];
        if (d > bestD) { bestD = d; best = k; }
    }
    if (best >= 0 && bestD >= thr) {
        out.push(best);
        hullSplit(cv, a, best, thr, minLen, out, depth + 1);
        hullSplit(cv, best, b, thr, minLen, out, depth + 1);
    }
}

function segment() {
    var F = feat;
    if (!F) return;
    var nf = F.nf, eDb = F.eDb, bDb = F.bDb, hop = F.hop;
    var ws = clamp(P.wsens / 100, 0, 1), ss = clamp(P.ssens / 100, 0, 1);
    var range = F.top - F.floor;
    var thr = F.floor + clamp(range * 0.25, 5, 20);
    thr = Math.min(thr, F.top - 10);
    thr = Math.max(thr, F.top - 48);
    var k, r;

    // 1) active runs (hysteresis)
    var runs = [], on = false, st = 0;
    for (k = 0; k < nf; k++) {
        if (!on && eDb[k] > thr) { on = true; st = k; }
        else if (on && eDb[k] < thr - 3) { on = false; runs.push([st, k]); }
    }
    if (on) runs.push([st, nf]);

    // 2) bridge short gaps (shorter gap = more words at high sensitivity)
    var gapF = Math.round(lerp(T.gapHi, T.gapLo, ws) / 5);
    var merged = [];
    for (r = 0; r < runs.length; r++) {
        if (merged.length && runs[r][0] - merged[merged.length - 1][1] < gapF) merged[merged.length - 1][1] = runs[r][1];
        else merged.push([runs[r][0], runs[r][1]]);
    }
    // drop clicks / breaths: very short and not loud
    var keep = [];
    for (r = 0; r < merged.length; r++) {
        var a0 = merged[r][0], b0 = merged[r][1], mxv = -1e9;
        for (k = a0; k < b0; k++) if (eDb[k] > mxv) mxv = eDb[k];
        if (b0 - a0 < 8 && mxv < thr + 10) continue;
        keep.push([a0, b0]);
    }

    var wThr = lerp(T.wThrHi, T.wThrLo, ws), minW = Math.round(lerp(T.minWHi, T.minWLo, ws) / 5);
    var sThr = lerp(T.sThrHi, T.sThrLo, ss), minS = Math.round(lerp(T.minSHi, T.minSLo, ss) / 5);
    var pre = 9, post = 18; // edge extension limits in frames (45 / 90 ms)
    var lvl = F.floor + Math.min(6, range * 0.12);
    var list = [];
    if (P.ai && asrList && asrList.length) {
        list = asrPieces(eDb, thr, lvl, hop);
    } else
    for (r = 0; r < keep.length; r++) {
        var a = keep[r][0], b = keep[r][1];
        var cuts = [];
        hullSplit(eDb, a, b, wThr, minW, cuts, 0);
        cuts.sort(function (x, y) { return x - y; });
        var edges = [a].concat(cuts).concat([b]);
        for (k = 0; k < edges.length - 1; k++) {
            list.push({ a: edges[k], b: edges[k + 1], gapL: k == 0, gapR: k == edges.length - 2 });
        }
    }
    // a word needs a vowel: merge pieces without a strong 300-3500 Hz nucleus
    // (stray "s", "t", breaths) or that are very short into a neighbour
    if (!(P.ai && asrList && asrList.length)) list = mergeWeak(list, bDb, F.btop, eDb);

    // extend gap-side edges to catch consonant onsets and tails
    for (k = 0; k < list.length; k++) {
        var w = list[k];
        w.ea = w.a; w.eb = w.b;
        if (w.gapL) {
            var limA = k > 0 ? list[k - 1].eb : 0, cA = 0;
            while (w.ea > limA && cA < pre && eDb[w.ea - 1] > lvl) { w.ea--; cA++; }
            w.ea = Math.max(limA, w.ea - 2);
        }
        if (w.gapR) {
            var limB = k < list.length - 1 ? list[k + 1].a - 1 : nf, cB = 0;
            while (w.eb < limB && cB < post && eDb[w.eb] > lvl) { w.eb++; cB++; }
            w.eb = Math.min(limB, w.eb + 3);
        }
    }

    words = [];
    for (k = 0; k < list.length && k < 64; k++) {
        var L = list[k];
        var hue = (0.56 + k * 0.618034) % 1;
        var word = mkSlice(L.ea * hop, Math.min(nFrames, L.eb * hop), "word", k, 0, 1, hue);
        word.text = L.text || "";
        var sc = [];
        hullSplit(bDb, L.a, L.b, sThr, minS, sc, 0);
        sc.sort(function (x, y) { return x - y; });
        var se = [word.s];
        for (var q = 0; q < sc.length; q++) se.push(sc[q] * hop + Math.floor(hop / 2));
        se.push(word.e);
        word.cuts = se;
        word.subs = partsFromCuts(word, se);
        words.push(word);
    }
    phrase = nFrames > 0 ? mkSlice(0, nFrames, "phrase", -1, 0, 1, 0.08) : null;
    if (keySlice && keySlice.kind != "phrase") keySlice = null;
    if (P.snap) computeTunes();
}

// ---------------------------------------------------------------- AI words
// Speech recognition gives word onsets (+-60 ms); each boundary is then
// snapped to the deepest nearby energy valley and silent edges are trimmed.
function asrPieces(eDb, thr, lvl, hop) {
    var nf = eDb.length, fps = sr / hop, W = asrList, out = [], k, q;
    var starts = [];
    for (k = 0; k < W.length; k++) starts.push(clamp(Math.round(W[k].t * fps), 0, nf - 1));
    // the recogniser often stamps the first word at 0 s: move it to the real onset
    var onset = 0;
    while (onset < nf - 1 && eDb[onset] <= thr) onset++;
    var lim0 = W.length > 1 ? Math.max(0, starts[1] - 6) : nf - 1;
    if (starts[0] < onset) starts[0] = Math.min(onset, lim0);
    var cuts = [];
    for (k = 1; k < W.length; k++) {
        var c = starts[k], lo = Math.max(starts[k - 1] + 6, c - 26), hi = Math.min(nf - 1, c + 12);
        var best = c, bv = 1e9;
        for (q = lo; q <= hi; q++) {
            var v = eDb[q] + Math.abs(q - c) * 0.08;
            if (v < bv) { bv = v; best = q; }
        }
        cuts.push(Math.max(best, (cuts.length ? cuts[cuts.length - 1] : 0) + 2));
    }
    // phrase onset / end from the acoustic activity
    var a0 = Math.max(0, starts[0] - 50), first = starts[0];
    for (q = Math.max(0, starts[0] - 50); q < Math.min(nf, starts[0] + 30); q++) if (eDb[q] > thr) { first = q; break; }
    var lastTok = clamp(Math.round(W[W.length - 1].l * fps), 0, nf - 1), endF = lastTok;
    for (q = lastTok; q < Math.min(nf, lastTok + 200); q++) { if (eDb[q] > thr - 3) endF = q + 1; else if (q - endF > 24) break; }
    var edges = [Math.min(first, cuts.length ? cuts[0] - 1 : first)].concat(cuts).concat([Math.max(endF, (cuts.length ? cuts[cuts.length - 1] : first) + 4)]);
    for (k = 0; k < W.length; k++) {
        var a = edges[k], b = Math.min(nf, edges[k + 1]);
        // trim silence inside the piece (pauses between words)
        var ta = a, tb = b;
        while (ta < tb - 4 && eDb[ta] < thr - 3) ta++;
        while (tb > ta + 4 && eDb[tb - 1] < thr - 3) tb--;
        out.push({ a: ta, b: tb, gapL: ta > a || k == 0, gapR: tb < b || k == W.length - 1, text: W[k].w });
    }
    // drop silent phantoms, glue fragments shorter than 50 ms to a neighbour ("to"+"night")
    var res = [];
    for (k = 0; k < out.length; k++) {
        var pc = out[k], mx = -1e9;
        for (q = pc.a; q < pc.b; q++) if (eDb[q] > mx) mx = eDb[q];
        if (mx < thr) continue;
        res.push(pc);
    }
    for (k = 0; k < res.length && res.length > 1; k++) {
        if (res[k].b - res[k].a >= 7) continue;
        if (k < res.length - 1) { res[k + 1].a = res[k].a; res[k + 1].gapL = res[k].gapL; res[k + 1].text = res[k].text + " " + res[k + 1].text; }
        else { res[k - 1].b = res[k].b; res[k - 1].gapR = res[k].gapR; res[k - 1].text += " " + res[k].text; }
        res.splice(k, 1); k--;
    }
    return res;
}

function asrstatus() {
    var a = arrayfromargs(arguments), st = String(a[0]);
    asrState = st;
    var msg = a.slice(1).join(" ");
    if (st == "ready") { installing = 0; installWarn.cancel(); outlet(1, "ai", 2); if (P.ai) { setStatus("AI words ready" + (msg ? " - " + msg : "")); if (feat) sendAsr(); } }
    else if (st == "missing") { outlet(1, "ai", 0); if (P.ai) installAsr(); }
    else if (st == "busy") outlet(1, "ai", 1);
    else if (st == "error") { outlet(1, "ai", 0); if (P.ai) setStatus("AI words error: " + msg); }
    else if (st == "info") { if (P.ai) setStatus("AI words: " + msg); }
}

var installing = 0;
var installWarn = new Task(function () {
    if (asrState != "ready" && P.ai) setStatus("AI words still installing... if it never finishes see README (Terminal: npm install)");
}, this);

function installAsr() {
    if (installing) return;
    installing = 1;
    setStatus("AI words: one-time install of the offline speech engine (~35 MB, 1-3 min)...");
    outlet(2, "node", "script", "npm", "install");
    installWarn.schedule(240000);
}

function aistart() {
    // called once at boot: start the node script (it reports ready / missing)
    outlet(2, "node", "script", "start");
}

function sendAsr() {
    if (!P.ai || asrState != "ready" || !asr16.length) return;
    asrId++;
    outlet(2, "node", "asrbegin", asrId);
    for (var k = 0; k < asr16.length; k += 2000) outlet(2, ["node", "asrchunk"].concat(asr16.slice(k, k + 2000)));
    outlet(2, "node", "asrgo", asrId, 16000);
    setStatus("AI: listening for words...");
}

// asrwords id  t1 l1 word1  t2 l2 word2 ...   (seconds)
function asrwords() {
    var a = arrayfromargs(arguments);
    if (Number(a[0]) != asrId) return;
    var list = [];
    for (var k = 1; k + 2 < a.length; k += 3) list.push({ t: Number(a[k]), l: Number(a[k + 1]), w: String(a[k + 2]).toLowerCase() });
    if (!list.length) { setStatus("AI heard no words - using acoustic chop"); return; }
    asrList = list;
    segment(); buildPads(); sendUI(); summary();
}

function pieceMax(cv, a, b) {
    var m = -1e9;
    for (var k = a; k < b; k++) if (cv[k] > m) m = cv[k];
    return m;
}

function mergeWeak(list, bDb, btop, eDb) {
    var minF = Math.round(T.minWordMs / 5), guard = 0;
    while (list.length > 1 && guard++ < 200) {
        var worst = -1, wScore = 0, k;
        for (k = 0; k < list.length; k++) {
            var L = list[k], def = 0;
            var vb = btop - pieceMax(bDb, L.a, L.b);
            if (vb > T.vowelDb) def += vb - T.vowelDb + 1;
            if (L.b - L.a < minF) def += (minF - (L.b - L.a)) * 0.5 + 1;
            if (def > wScore) { wScore = def; worst = k; }
        }
        if (worst < 0) break;
        // merge towards the neighbour with the smaller (or shallower) gap
        var cur = list[worst], left = worst > 0 ? list[worst - 1] : null, right = worst < list.length - 1 ? list[worst + 1] : null;
        var gl = left ? cur.a - left.b : 1e9, gr = right ? right.a - cur.b : 1e9;
        if (gl == gr && left && right) {
            gl = -Math.min(eDb[Math.max(0, cur.a - 1)], eDb[cur.a]);
            gr = -Math.min(eDb[Math.max(0, cur.b - 1)], eDb[Math.min(eDb.length - 1, cur.b)]);
        }
        if (left && gl <= gr) { left.b = cur.b; left.gapR = cur.gapR; list.splice(worst, 1); }
        else if (right) { right.a = cur.a; right.gapL = cur.gapL; list.splice(worst, 1); }
        else break;
    }
    return list;
}

function mkSlice(s, e, kind, wi, k, nk, hue) {
    return { s: Math.max(0, Math.round(s)), e: Math.round(e), kind: kind, wi: wi, k: k, nk: nk, hue: hue,
             pitch: undefined, tuneOff: 0, env: null };
}

function partsFromCuts(word, se) {
    if (se.length <= 2) return [];
    var out = [];
    for (var q = 0; q < se.length - 1; q++) out.push(mkSlice(se[q], se[q + 1], "part", word.wi, q, se.length - 1, word.hue));
    return out;
}

// merge the shortest neighbouring parts until count <= max
function fitSubs(word, max) {
    if (word.subs.length <= max) return word.subs;
    var key = "fit" + max;
    if (word[key]) return word[key];
    var se = word.cuts.slice(0);
    while (se.length - 1 > max) {
        var bestQ = 1, bestL = 1e20;
        for (var q = 1; q < se.length - 1; q++) {
            var l = se[q + 1] - se[q - 1];
            if (l < bestL) { bestL = l; bestQ = q; }
        }
        se.splice(bestQ, 1);
    }
    word[key] = partsFromCuts(word, se);
    return word[key];
}

function sliceEnv(sl) {
    if (sl.env) return sl.env;
    var F = feat, out = [], N = 8;
    if (!F) return [0, 0, 0, 0, 0, 0, 0, 0];
    var fa = Math.floor(sl.s / F.hop), fb = Math.max(fa + 1, Math.floor(sl.e / F.hop));
    var rng = Math.max(1, F.top - F.floor);
    for (var q = 0; q < N; q++) {
        var x0 = Math.floor(fa + (fb - fa) * q / N), x1 = Math.max(x0 + 1, Math.floor(fa + (fb - fa) * (q + 1) / N));
        var mxv = -1e9;
        for (var k = x0; k < x1 && k < F.nf; k++) if (F.eDb[k] > mxv) mxv = F.eDb[k];
        out.push(Math.round(clamp((mxv - F.floor) / rng, 0, 1) * 100) / 100);
    }
    sl.env = out;
    return out;
}

// ---------------------------------------------------------------- pitch (YIN)
function ensurePitch(sl) {
    if (sl.pitch !== undefined) return sl.pitch;
    sl.pitch = detectPitch(sl.s, sl.e);
    sl.tuneOff = sl.pitch > 0 ? nearestScaleOffset(sl.pitch) : 0;
    return sl.pitch;
}

function detectPitch(s, e) {
    var F = feat;
    if (!F || e - s < sr * 0.03) return -1;
    var fa = Math.floor(s / F.hop), fb = Math.min(F.nf, Math.floor(e / F.hop)), best = fa, bv = -1e9, k;
    for (k = fa; k < fb; k++) if (F.bDb[k] > bv) { bv = F.bDb[k]; best = k; }
    if (bv < F.floor + 8) return -1;
    var D = Math.max(1, Math.round(sr / 11025)), fs = sr / D;
    var W = Math.round(fs * 0.032), tMin = Math.floor(fs / 900), tMax = Math.ceil(fs / 70);
    var need = (W + tMax + 2) * D;
    if (need > nFrames) return -1;
    var center = best * F.hop + F.hop / 2;
    var st = Math.round(center - need / 2);
    st = clamp(st, 0, nFrames - need);
    var raw = new Buffer(BUF).peek(1, st, need);
    if (!raw || typeof raw == "number") return -1;
    var x = [], q, j, sum;
    for (q = 0; q < W + tMax + 2; q++) {
        sum = 0;
        for (j = 0; j < D; j++) sum += raw[q * D + j] || 0;
        x.push(sum / D);
    }
    var d = [0], dp = [1], run = 0, tau, diff, acc;
    for (tau = 1; tau <= tMax + 1; tau++) {
        acc = 0;
        for (q = 0; q < W; q++) { diff = x[q] - x[q + tau]; acc += diff * diff; }
        d[tau] = acc; run += acc;
        dp[tau] = run > 0 ? acc * tau / run : 1;
    }
    var found = -1;
    for (tau = tMin; tau <= tMax; tau++) {
        if (dp[tau] < 0.15 && dp[tau] <= dp[tau + 1]) { found = tau; break; }
    }
    if (found < 0) {
        var mv = 1e9;
        for (tau = tMin; tau <= tMax; tau++) if (dp[tau] < mv) { mv = dp[tau]; found = tau; }
        if (mv > 0.35) return -1;
    }
    var t = found;
    if (t > 1 && t < tMax) {
        var y0 = dp[t - 1], y1 = dp[t], y2 = dp[t + 1], den = (y0 - 2 * y1 + y2);
        if (Math.abs(den) > 1e-9) t = t + 0.5 * (y0 - y2) / den;
    }
    var f0 = fs / t;
    if (!(f0 > 60 && f0 < 1000)) return -1;
    return 69 + 12 * Math.log(f0 / 440) / Math.LN2;
}

function nearestScaleOffset(m) {
    var best = 0, bd = 1e9, o, q, cand;
    for (o = -1; o <= 1; o++) {
        for (q = 0; q < scaleInts.length; q++) {
            cand = (Math.floor(m / 12) + o) * 12 + ((scaleRoot + scaleInts[q]) % 12);
            if (Math.abs(cand - m) < bd) { bd = Math.abs(cand - m); best = cand - m; }
        }
    }
    return best;
}

function computeTunes() {
    for (var k = 0; k < 64; k++) {
        var sl = pads[k];
        if (sl && sl.pitch !== undefined) sl.tuneOff = sl.pitch > 0 ? nearestScaleOffset(sl.pitch) : 0;
    }
}

// ---------------------------------------------------------------- pad layout
// pad index p = row*8 + col, row 0 = bottom (MIDI note = base + p)
function rc(row, col) { return row * 8 + col; }
function readingPad(i) { return rc(7 - Math.floor(i / 8), i % 8); }

function buildPads() {
    var k;
    for (k = 0; k < 64; k++) pads[k] = null;
    if (!words.length || P.mode == 3) return;
    var W = words.length;
    if (P.mode == 0 && W <= 16) {
        var bands = W <= 8 ? 1 : 2, rows = 8 / bands, maxSub = rows - 1;
        for (k = 0; k < W; k++) {
            var band = Math.floor(k / 8), col = k % 8, top = 7 - band * rows;
            pads[rc(top, col)] = words[k];
            var subs = fitSubs(words[k], maxSub);
            for (var q = 0; q < subs.length; q++) pads[rc(top - 1 - q, col)] = subs[q];
        }
    } else if (P.mode == 1) {
        var list = [];
        for (k = 0; k < W; k++) {
            if (words[k].subs.length) list = list.concat(words[k].subs);
            else list.push(words[k]);
        }
        for (k = 0; k < list.length && k < 64; k++) pads[readingPad(k)] = list[k];
    } else {
        for (k = 0; k < W && k < 64; k++) pads[readingPad(k)] = words[k];
    }
    for (k = 0; k < 64; k++) if (pads[k]) ensurePitch(pads[k]);
}

function label(sl) {
    if (sl.kind == "word") return (words[sl.wi] && words[sl.wi].text) ? words[sl.wi].text : "W" + (sl.wi + 1);
    if (sl.kind == "phrase") return "ALL";
    var t = words[sl.wi] && words[sl.wi].text;
    if (t) return syllText(t, sl.k, sl.nk);
    return (sl.wi + 1) + "abcdefghij".charAt(sl.k);
}

// split a word's letters roughly into nk syllable-ish chunks (for labels only)
function syllText(t, k, nk) {
    if (nk <= 1) return t;
    var v = "aeiouy", groups = [], cur = "", seenV = false, i, ch;
    for (i = 0; i < t.length; i++) {
        ch = t.charAt(i);
        var isV = v.indexOf(ch) >= 0;
        if (seenV && isV && cur.length && v.indexOf(cur.charAt(cur.length - 1)) < 0) {
            // move the last consonant to the next group (ev-ery, hap-py)
            var last = cur.charAt(cur.length - 1);
            if (cur.length > 1) { groups.push(cur.substring(0, cur.length - 1)); cur = last; } else { groups.push(cur); cur = ""; }
            seenV = false;
        }
        cur += ch;
        if (isV) seenV = true;
    }
    if (cur) groups.push(cur);
    // merge/split to exactly nk chunks
    while (groups.length > nk) {
        var bi = 0, bl = 1e9;
        for (i = 0; i < groups.length - 1; i++) if (groups[i].length + groups[i + 1].length < bl) { bl = groups[i].length + groups[i + 1].length; bi = i; }
        groups.splice(bi, 2, groups[bi] + groups[bi + 1]);
    }
    if (groups.length < nk) {
        var L = t.length, start = Math.floor(L * k / nk), end = Math.floor(L * (k + 1) / nk);
        return t.substring(start, Math.max(start + 1, end));
    }
    return groups[k];
}

function sendUI() {
    outlet(1, "begin");
    for (var k = 0; k < 64; k++) {
        if (P.mode == 3) {
            var note = P.base + k, pc = ((note % 12) + 12) % 12;
            var black = (pc == 1 || pc == 3 || pc == 6 || pc == 8 || pc == 10);
            outlet(1, "pad", k, pc == 0 ? 4 : (black ? 5 : 3), 0, noteName(note));
            continue;
        }
        var sl = pads[k];
        if (!sl) { outlet(1, "pad", k, 0, 0, "-"); continue; }
        outlet(1, ["pad", k, sl.kind == "word" ? 1 : 2, sl.hue, label(sl)].concat(sliceEnv(sl)));
    }
    var reg = ["regions"];
    for (k = 0; k < words.length; k++) reg.push(frac(words[k].s), frac(words[k].e), words[k].hue, label(words[k]));
    outlet(1, reg);
    var mk = ["marks"];
    for (k = 0; k < words.length; k++) {
        var c = words[k].cuts;
        for (var q = 1; q < c.length - 1; q++) mk.push(frac(c[q]));
    }
    outlet(1, mk);
    var ks = keySlice || phrase;
    if (P.mode == 3 && ks) outlet(1, "sel", frac(ks.s), frac(ks.e)); else outlet(1, "sel", -1, -1);
    outlet(1, "refresh");
}

function sendWave() {
    outlet(1, ["wave"].concat(waveBins));
}

function frac(s) { return nFrames > 0 ? Math.round((s / nFrames) * 10000) / 10000 : 0; }

// ---------------------------------------------------------------- playing
function note(n, vel) {
    n = Number(n); vel = Number(vel);
    if (vel > 0) noteOn(n, vel, 0); else noteOff(n);
}

function padclick(p, v) {
    p = Number(p); v = Number(v);
    if (p < 0 || p > 63) return;
    if (v > 0) noteOn(P.base + p, v, 1); else noteOff(P.base + p);
}

function noteOn(n, vel, fromUI) {
    if (learning && !fromUI) {
        learning = 0;
        var b = clamp(n, 0, 64);
        P.base = b;
        outlet(2, "setbase", b);
        outlet(1, "base", b);
        setStatus("Pads start at " + noteName(b) + " - bottom-left pad = note " + b);
        sendUI();
        return;
    }
    if (!nFrames || !words.length) {
        if (!recording) setStatus("Nothing to play yet - record or drop audio first");
        return;
    }
    var sl, semis, p = n - P.base;
    if (P.mode == 3) {
        sl = keySlice || phrase;
        if (!sl) return;
        var pt = ensurePitch(sl);
        semis = (P.tune && pt > 0) ? (n - pt) : (n - 60);
        semis += P.pitch + bendSemis;
        trigger(sl, n, vel, semis, (p >= 0 && p < 64) ? p : -1);
        setInfo("Keys: " + (sl.kind == "phrase" ? "whole phrase" : label(sl)) + "  ->  " + noteName(n) +
            ((P.tune && pt > 0) ? "  (tuned)" : ""));
        return;
    }
    if (p < 0 || p > 63) return;
    sl = pads[p];
    if (!sl) return;
    keySlice = sl;
    semis = P.pitch + bendSemis + (P.snap ? sl.tuneOff : 0);
    trigger(sl, n, vel, semis, p);
    var pt2 = ensurePitch(sl);
    var info = (sl.kind == "word" ? "Word " + (sl.wi + 1) : "Word " + (sl.wi + 1) + "  part " + (sl.k + 1) + "/" + sl.nk) +
        "   " + fmtSec(sl.e - sl.s) + (pt2 > 0 ? "   ~" + noteName(pt2) : "") + "   note " + n;
    setInfo(info);
}

function noteOff(n) {
    var t = now();
    for (var k = 0; k < NV; k++) {
        var v = voices[k];
        if (v.busy && v.note == n && v.held) {
            v.held = 0;
            if (P.trig == 1 || v.loop) {
                outlet(0, k, "ev", 0, Math.max(2, P.release));
                v.relT = t;
                hit(v.pad, 0);
            }
        }
    }
}

function allNotesOff() {
    for (var k = 0; k < NV; k++) {
        if (voices[k].busy) {
            outlet(0, k, "ev", 0, 10);
            voices[k].busy = 0; voices[k].held = 0;
            hit(voices[k].pad, 0);
        }
    }
}

function stutterMs() {
    var b = STUTTER_BEATS[clamp(Math.round(P.stutter), 0, STUTTER_BEATS.length - 1)];
    return b > 0 ? b * 60000 / clamp(tempo, 20, 999) : 0;
}

function allocVoice() {
    var n = clamp(Math.round(P.poly), 1, NV), k, t = now(), best = -1, bt = 1e20;
    for (k = 0; k < n; k++) if (!voices[k].busy) return k;
    for (k = 0; k < n; k++) if (voices[k].relT && t - voices[k].relT > P.release) return k;
    for (k = 0; k < n; k++) if (voices[k].relT && voices[k].relT < bt) { bt = voices[k].relT; best = k; }
    if (best >= 0) return best;
    for (k = 0; k < n; k++) if (voices[k].t < bt) { bt = voices[k].t; best = k; }
    return best < 0 ? 0 : best;
}

function trigger(sl, n, vel, semis, padIdx) {
    if (P.choke) {
        for (var c = 0; c < NV; c++) if (voices[c].busy) {
            outlet(0, c, "ev", 0, 12);
            voices[c].held = 0; voices[c].loop = 0; voices[c].relT = now() - 100000;
            hit(voices[c].pad, 0);
        }
    }
    var vi = allocVoice(), v = voices[vi];
    if (v.busy) hit(v.pad, 0);
    var startMs = sl.s / sr * 1000, lenMs = (sl.e - sl.s) / sr * 1000;
    if (lenMs < 3) return;
    var rate = Math.pow(2, clamp(semis, -48, 48) / 12);
    var looping = (P.trig == 2);
    var seg = lenMs, stm = stutterMs();
    if (stm > 0) { seg = Math.min(lenMs, stm * rate); looping = true; }
    var dur = seg / rate;
    var off = P.reverse ? startMs + seg : startMs;
    var len = P.reverse ? -seg : seg;
    var fade = Math.min(looping ? 3 : 6, dur * 0.2);
    var up = clamp(fade / dur, 0.0005, 0.45), down = clamp(1 - (fade * (P.reverse ? 1 : 1.5)) / dur, 0.55, 0.9995);
    var vs = clamp(P.vel / 100, 0, 1);
    var amp = ((1 - vs) + vs * Math.pow(clamp(vel, 1, 127) / 127, 1.6)) * normGain * 0.8;
    var pan = ((vi % 2) ? 1 : -1) * clamp(P.spread / 100, 0, 1) * (0.35 + 0.65 * ((vi * 0.37) % 1));
    var ang = (pan + 1) * Math.PI / 4;
    outlet(0, vi, "ln", len);
    outlet(0, vi, "of", off);
    outlet(0, vi, "tz", up, down);
    outlet(0, vi, "pn", Math.cos(ang), Math.sin(ang));
    outlet(0, vi, "ev", 0, 0, amp, Math.max(0.5, P.attack));
    outlet(0, vi, "ph", 0, 0, 1, dur);
    v.busy = 1; v.note = n; v.held = 1; v.t = now(); v.relT = 0; v.loop = looping ? 1 : 0; v.dur = dur; v.pad = padIdx;
    hit(padIdx, 1);
    outlet(1, "play", frac(sl.s), frac(sl.e));
}

// end of a phase ramp (from line~ bang)
function vend(k) {
    k = Number(k);
    var v = voices[k];
    if (!v || !v.busy) return;
    if (v.loop && v.held) { outlet(0, k, "ph", 0, 0, 1, v.dur); return; }
    v.busy = 0; v.held = 0;
    outlet(0, k, "ev", 0, 2);
    hit(v.pad, 0);
}

function hit(p, on) {
    if (p === undefined || p < 0 || p > 63) return;
    outlet(1, "hit", p, on ? 1 : 0);
}

// click on the waveform: select a word for Keys mode and audition it
function waveclick(f) {
    f = Number(f);
    if (!nFrames) return;
    var s = f * nFrames, sel = phrase;
    for (var k = 0; k < words.length; k++) if (s >= words[k].s && s < words[k].e) { sel = words[k]; break; }
    if (!sel) return;
    keySlice = sel;
    ensurePitch(sel);
    var pt = sel.pitch;
    trigger(sel, -999, 100, P.pitch, -1);
    for (var q = 0; q < NV; q++) if (voices[q].note == -999) voices[q].held = 0;
    setInfo("Selected " + (sel.kind == "phrase" ? "whole phrase" : label(sel)) + (pt > 0 ? "  ~" + noteName(pt) : "") +
        "  (Keys mode plays this)");
    if (P.mode == 3) sendUI();
}

// ---------------------------------------------------------------- MIDI clip export
function makeclip(v) {
    if (v === 0) return;
    if (!words.length) { setStatus("Nothing to put in a clip yet"); return; }
    var evs = [], k, p;
    for (p = 0; p < 64; p++) {
        var sl = pads[p];
        if (!sl) continue;
        if (P.mode == 0 && sl.kind != "word") continue;
        evs.push({ s: sl.s, e: sl.e, pitch: P.base + p });
    }
    if (P.mode == 3) {
        setStatus("Make Clip works in the Words / Syllables / Word List modes");
        return;
    }
    evs.sort(function (a, b) { return a.s - b.s; });
    if (!evs.length) return;
    var bps = clamp(tempo, 20, 999) / 60, t0 = evs[0].s, notes = [];
    for (k = 0; k < evs.length; k++) {
        var st = Math.round(((evs[k].s - t0) / sr) * bps * 4) / 4;
        var du = Math.max(0.25, Math.round(((evs[k].e - evs[k].s) / sr) * bps * 4) / 4);
        notes.push({ pitch: evs[k].pitch, start_time: st, duration: du, velocity: 100, mute: 0 });
    }
    var end = notes[notes.length - 1].start_time + notes[notes.length - 1].duration;
    var len = Math.max(4, Math.ceil(end / 4) * 4);
    try {
        var tr = new LiveAPI(null, "this_device canonical_parent");
        var guard = 0;
        while (tr && String(tr.type) != "Track" && guard < 8) {
            tr = new LiveAPI(null, tr.unquotedpath + " canonical_parent");
            guard++;
        }
        if (!tr || String(tr.type) != "Track") { setStatus("Could not find this track"); return; }
        var nslots = tr.getcount("clip_slots"), slot = null, si = -1;
        for (k = 0; k < nslots; k++) {
            var cs = new LiveAPI(null, tr.unquotedpath + " clip_slots " + k);
            if (Number(cs.get("has_clip")) == 0) { slot = cs; si = k; break; }
        }
        if (!slot) { setStatus("No empty clip slot on this track"); return; }
        slot.call("create_clip", len);
        var clip = new LiveAPI(null, slot.unquotedpath + " clip");
        clip.set("name", "VoChop phrase");
        var ok = false;
        try {
            clip.call("add_new_notes", { notes: notes });
            var chk = clip.call("get_notes_extended", 0, 128, 0, len);
            ok = String(chk).indexOf("pitch") >= 0;
        } catch (e1) { ok = false; }
        if (!ok) {
            // legacy note API (still present in Live 11/12)
            clip.call("set_notes");
            clip.call("notes", notes.length);
            for (k = 0; k < notes.length; k++)
                clip.call("note", notes[k].pitch, notes[k].start_time.toFixed(4), notes[k].duration.toFixed(4), 100, 0);
            clip.call("done");
        }
        setStatus("MIDI clip created in slot " + (si + 1) + " (" + notes.length + " notes) - fire it!");
    } catch (e) {
        setStatus("Make Clip failed: " + e);
    }
}

function pushstate(v) {
    setStatus(Number(v) ? "PUSH PADS on: Push pads show the chop colours" : "PUSH PADS off (or no Push found) - notes still work");
}

function anything() {
    post("VoChop: unknown message " + messagename + "\n");
}
