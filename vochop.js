/*
  VoChop - main engine  (Max for Live [js], ES5)
  ------------------------------------------------
  - records a phrase (own audio input, or the "VoChop Input" helper device)
  - chops it into WORDS (pauses + energy valleys, or AI speech recognition)
    and splits every word into 1-3 PARTS; the "rest" slice = word minus its first part
  - pad surface (Push 3 / on-screen grid), top two rows always = words / rests:
      Words layout : 4 row-pairs = 32 words
      Notes layout : rows 3-8 = in-key keyboard, plays the selected word tuned
                     (retune~) to the note, with Cloud / Loop / Repeat sustain
      Seq layout   : rows 3-6 = 32 steps, row 7 = pages, row 8 = step / clip length
  - MIDI note map (what gets recorded into clips):
      0-31  = words 1-32        32-63 = rests of words 1-32
      64-127 = keys: the selected word tuned; C5-B5 (84-95) = nearest pitch,
               every octave up/down from there = +/-12
  - 8-voice polyphony (gen~ voices), effects, takes, clip recording / step sequencer
*/

autowatch = 0;
inlets = 1;
outlets = 3;
setinletassist(0, "messages");
setoutletassist(0, "to voices");
setoutletassist(1, "to UI (grid / big view / push)");
setoutletassist(2, "to patch (buffer, bus, fx, input, banks, state)");

var me = this;
var BUF = (jsarguments.length > 1) ? String(jsarguments[1]) : "vochop_buf";
var NV = 8;
var MAXREC_MS = 60000;
var NBINS = 420;
var NWORDS = 32, REST0 = 32, KEY0 = 64, HOME = 84, OCT_MIN = -1, OCT_MAX = 1;

// ---------------------------------------------------------------- params
var P = {
    layout: 1,    // 0 Words, 1 Notes, 2 Seq
    keys: 0,      // hold mode for key notes: 0 Cloud, 1 Loop, 2 Repeat, 3 One-Shot
    pads: 0,      // word/rest pads: 0 One-Shot, 1 Gate, 2 Loop, 3 Repeat
    atune: 0, key: 0,
    pitch: 0, attack: 2, release: 250, grain: 120, rate: 2,
    spread: 30, poly: 8, vel: 70, reverse: 0, choke: 1,
    wsens: 50, ssens: 50, link: 1, ai: 0,
    page: 0, octave: 0,
    ftype: 0, cutoff: 20000, reso: 10, crush: 0, drive: 0,
    delay: 0, dtime: 2, fdbk: 40, reverb: 0, size: 60,
    thresh: -40, autorec: 0
};
// chopping constants (tuned on test phrases; sensitivity knobs move around these)
var T = { gapHi: 160, gapLo: 25, wThrHi: 20, wThrLo: 6, minWHi: 150, minWLo: 70,
          maxSylHi: 4, maxSylLo: 2, sylThr: 3, minSyl: 16,
          sThrHi: 9, sThrLo: 1.5, minSHi: 120, minSLo: 45, vowelDb: 18, minWordMs: 90,
          onsetDb: 40, restMinMs: 150, dropGapMs: 20, ceilLo: 8, ceilHi: 18, maxMsHi: 1300, maxMsLo: 600 };
var LAYOUT_NAMES = ["WORDS", "NOTES", "SEQ"];
var KEYS_NAMES = ["Cloud", "Loop", "Repeat", "One-Shot"];
var RATE_BEATS = [1, 0.5, 0.25, 0.125, 1 / 3, 1 / 6];
var DTIME_BEATS = [0.25, 1 / 3, 0.5, 0.75, 1, 1.5, 2];
var SEQ_RES = [0.125, 0.25, 0.5, 1];
var SEQ_LEN = [1, 2, 4, 8];
var NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];

// ---------------------------------------------------------------- state
var ready = 0, bootT = 0;
var sr = 44100, nFrames = 0, recLen = 0, normGain = 1;
var feat = null, waveBins = [];
var words = [], sel = null;
var surf = [], padNote = [];
var voices = [];
var recording = 0, waitingDone = 0, recStartT = 0, recStopT = 0, recLocal = 0, autoRec = 0, lastLoud = 0;
var pendingLoad = 0, inputSeen = 0;
var takes = [], takeIdx = -1, lastState = "";
var tempo = 120, scaleRoot = 0, scaleInts = [0, 2, 4, 5, 7, 9, 11];
var bendSemis = 0, tempoApi = null, scaleApi = null, rootApi = null, songApi = null, trApi = null, trApiPath = "";
var asrList = null, asrId = 0, asrState = "off", asr16 = [];   // AI words
var seq = { res: 1, page: 0, steps: [], len: 8, pos: -1 };
var recNotes = {}, recPending = [];
var inIO = null, inTypes = [], inChans = [];
var trackPath = "", trackId = 0;

var i;
for (i = 0; i < 64; i++) { surf[i] = null; padNote[i] = -1; }
for (i = 0; i < NV; i++) voices[i] = { busy: 0, note: -1, held: 0, t: 0, relT: 0, keep: 0, pad: -1, chop: 0, trig: 0, kill: 0 };

var recTask = new Task(function () { stopRecording(); }, this);
var doneTask = new Task(function () { if (waitingDone) recdone(-1); }, this);
var rechopTask = new Task(function () { if (feat) { segment(); refreshAll(); summary(); } }, this);
var seqTask = new Task(seqTick, this), tickSlot = -2, tickClip = null;
var recTaskCheck = new Task(recCheck, this);
var scaleTask = new Task(function () { refreshScale(); buildSurface(); sendUI(); }, this);

// ---------------------------------------------------------------- utils
function clamp(v, a, b) { return v < a ? a : (v > b ? b : v); }
function lerp(a, b, t) { return a + (b - a) * t; }
function now() { return new Date().getTime(); }
function setStatus(s) { outlet(1, "status", String(s)); }
function setInfo(s) { outlet(1, "info", String(s)); }
function noteName(n) { n = Math.round(n); return NOTE_NAMES[((n % 12) + 12) % 12] + (Math.floor(n / 12) - 2); }
function fmtSec(samps) { return (samps / sr).toFixed(2) + "s"; }
function ms(samps) { return samps / sr * 1000; }
function mtof(m) { return 440 * Math.pow(2, (m - 69) / 12); }
function parseJson(raw) {
    var s = (raw instanceof Array) ? raw.join(" ") : String(raw);
    var k = s.indexOf("{");
    if (k < 0) return null;
    try { return JSON.parse(s.substring(k)); } catch (e) { return null; }
}

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
    try {
        scaleApi = new LiveAPI(onScale, "live_set");
        scaleApi.property = "scale_intervals";
        rootApi = new LiveAPI(onScale, "live_set");
        rootApi.property = "root_note";
    } catch (e2) { }
    refreshScale();
    findTrack();
    announce();
    updateFx();
    outlet(2, "banks", "getcount");
    outlet(1, "pushboot");
    inputsRefresh();
    if (!words.length && !pendingLoad) setStatus("Press REC and speak (pick AUDIO FROM first) - or drop audio");
    refreshAll();
    if (P.layout == 2) seqEnter();
}

function onTempo(a) {
    if (a && a[0] == "tempo" && a.length > 1 && Number(a[1]) > 0) {
        tempo = Number(a[1]);
        updateFx();
    }
}

function onScale(a) {
    if (!ready) return;
    scaleTask.cancel(); scaleTask.schedule(50);
}

function refreshScale() {
    try {
        var s = song();
        var r = s.get("root_note");
        var iv = s.get("scale_intervals");
        if (r && r.length && !isNaN(Number(r[0]))) scaleRoot = Number(r[0]);
        if (iv && iv.length) {
            var out = [];
            for (var k = 0; k < iv.length; k++) { var v = Number(iv[k]); if (!isNaN(v)) out.push(v); }
            if (out.length) scaleInts = out;
        }
    } catch (e) { /* keep major scale */ }
}

function findTrack() {
    try {
        var tr = new LiveAPI(null, "this_device canonical_parent"), guard = 0;
        while (tr && String(tr.type) != "Track" && guard < 8) {
            tr = new LiveAPI(null, tr.unquotedpath + " canonical_parent");
            guard++;
        }
        if (tr && String(tr.type) == "Track") { trackPath = tr.unquotedpath; trackId = Number(tr.id); }
    } catch (e) { trackPath = ""; }
    return trackPath;
}

function announce() {
    outlet(2, "bus", P.link, "buf", BUF);
}

// ---------------------------------------------------------------- params in
function p(name, v) {
    P[name] = Number(v);
    switch (name) {
        case "layout":
            buildSurface(); sendUI();
            setInfo(LAYOUT_NAMES[P.layout] + " layout");
            if (P.layout == 2 && ready) seqEnter(); else seqTask.cancel();
            break;
        case "page": case "octave":
            buildSurface(); sendUI();
            if (P.layout == 2 && ready) seqRefresh();
            break;
        case "wsens": case "ssens":
            rechopTask.cancel(); rechopTask.schedule(120);
            break;
        case "key": case "atune":
            refreshScale();
            break;
        case "ai":
            if (P.ai) {
                if (asrState == "ready") { if (feat) sendAsr(); else setStatus("AI words on - record a phrase"); }
                else if (asrState == "missing") installAsr();
                else if (asrState == "error") { setStatus("AI words: retrying..."); outlet(2, "node", "retry"); }
                else if (asrState == "off") { setStatus("AI words: starting speech engine..."); asrState = "starting"; aistart(); }
                else setStatus("AI words: speech engine is still starting...");
            } else if (feat) { asrList = null; segment(); refreshAll(); summary(); }
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
function rec(v) {
    v = Number(v);
    if (!ready || now() - bootT < 1500) { outlet(2, "setrec", recording); return; }
    autoRec = 0;
    if (v > 0) startRecording(); else stopRecording();
}

function undo(v) {
    if (Number(v) === 0) return;
    if (recording) { stopRecording(); return; }
    if (takeIdx > 0) loadTake(takeIdx - 1);
    else setStatus("Nothing to undo");
}

function takeprev(v) { if (Number(v) === 0) return; if (takeIdx > 0) loadTake(takeIdx - 1); else setStatus("No earlier take"); }
function takenext(v) { if (Number(v) === 0) return; if (takeIdx < takes.length - 1) loadTake(takeIdx + 1); else setStatus("No later take"); }

// Push octave buttons / OCT-/OCT+ parameters: octave in Notes, word page elsewhere
function octup(v) { if (Number(v) === 0) return; shiftOct(1); }
function octdown(v) { if (Number(v) === 0) return; shiftOct(-1); }
function shiftOct(d) {
    if (P.layout == 1) {
        P.octave = clamp(P.octave + d, OCT_MIN, OCT_MAX);
        outlet(2, "setparam", "octave", P.octave);
        setInfo("Octave " + (P.octave > 0 ? "+" : "") + P.octave);
    } else {
        P.page = clamp(P.page + d, 0, 3);
        outlet(2, "setparam", "page", P.page);
        setInfo("Words " + (P.page * 8 + 1) + "-" + (P.page * 8 + 8));
        if (P.layout == 2) seqRefresh();
    }
    buildSurface(); sendUI();
}

function bend(v) {
    bendSemis = ((Number(v) - 64) / 64) * 2;
}

// ---------------------------------------------------------------- inter-device bus (VoChop Input helper)
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
    recStartT = now(); lastLoud = now();
    recLocal = inputSeen ? 0 : 1;
    outlet(2, "buf", "size", MAXREC_MS);
    if (recLocal) outlet(2, "lrec", 1);
    else outlet(2, "bus", P.link, "rec", 1, BUF);
    outlet(2, "setrec", 1);
    outlet(1, "rec", 1);
    setStatus(autoRec ? "AUTO REC... stops after 1.5 s of silence" : "REC... speak now - press REC again to chop");
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
    if (recLocal) outlet(2, "lrec", 0);
    else outlet(2, "bus", P.link, "rec", 0);
    if (autoRec) { autoRec = 0; }
}

// snapshot of the local record~ position when recording stopped (0..1)
function lfrac(v) { recdone(Number(v)); }

// input level (local input, every 30 ms): AUTO record
function lvl(v) {
    v = Number(v);
    var db = v > 0.000001 ? 20 * Math.log(v) / Math.LN10 : -120, t = now();
    if (db > P.thresh) lastLoud = t;
    if (P.autorec && !recording && !waitingDone && db > P.thresh && ready && t - bootT > 1500 && !inputSeen) {
        autoRec = 1;
        startRecording();
    } else if (recording && autoRec && t - lastLoud > 1500 && t - recStartT > 400) {
        stopRecording();
    }
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
        if (recLocal) setStatus("Nothing recorded: pick your mic in AUDIO FROM (or use the VoChop Input device)");
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
    sel = words.length ? words[0] : null;
    sendWave();
    refreshAll();
    summary(now() - t0);
    if (P.ai) { if (asrState == "ready") sendAsr(); else if (asrState == "missing") installAsr(); }
}

function refreshAll() {
    buildSurface();
    sendUI();
}

function summary(msv) {
    var parts = 0;
    for (var k = 0; k < words.length; k++) parts += words[k].np;
    var s = words.length + " words / " + parts + " parts  (" + fmtSec(nFrames) + ")";
    if (takes.length) s += "   take " + (takeIdx + 1) + "/" + takes.length;
    if (msv !== undefined) s += "   " + msv + " ms";
    if (!words.length) s = "No speech found - speak louder or closer to the mic";
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
            if (rph >= 1) { rph -= 1; asr16.push(lpB); }
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
function hullSplit(cv, a, b, thr, minLen, out, depth, ceil) {
    if (depth > 40 || b - a < 2 * minLen) return;
    var best = valley(cv, a, b, minLen, ceil);
    if (best.k >= 0 && best.d >= thr) {
        out.push(best.k);
        hullSplit(cv, a, best.k, thr, minLen, out, depth + 1, ceil);
        hullSplit(cv, best.k, b, thr, minLen, out, depth + 1, ceil);
    }
}

// deepest valley (below the hull) in [a,b) at least minLen from both ends (and below ceil, if given)
function valley(cv, a, b, minLen, ceil) {
    if (ceil === undefined) ceil = 1e9;
    var lm = new Array(b - a), m = -1e9, k, best = -1, bestD = 0, h, d;
    for (k = a; k < b; k++) { if (cv[k] > m) m = cv[k]; lm[k - a] = m; }
    m = -1e9;
    for (k = b - 1; k >= a; k--) {
        if (cv[k] > m) m = cv[k];
        if (k - a < minLen || b - k < minLen || cv[k] > ceil) continue;
        h = Math.min(lm[k - a], m);
        d = h - cv[k];
        if (d > bestD) { bestD = d; best = k; }
    }
    return { k: best, d: bestD };
}

// syllable nuclei = peaks of the vowel-band energy with enough prominence
function sylCount(bDb, a, b) {
    var n = 0, last = -1e9, k, j, floorV = feat.btop - 30;
    for (k = a + 1; k < b - 1; k++) {
        if (!(bDb[k] >= bDb[k - 1] && bDb[k] > bDb[k + 1]) || bDb[k] < floorV) continue;
        var pk = bDb[k], lmin = pk, rmin = pk;
        for (j = k - 1; j >= a && bDb[j] <= pk; j--) if (bDb[j] < lmin) lmin = bDb[j];
        if (j < a) lmin = Math.min(lmin, bDb[a]);
        for (j = k + 1; j < b && bDb[j] <= pk; j++) if (bDb[j] < rmin) rmin = bDb[j];
        if (pk - Math.max(lmin, rmin) < T.sylThr && !(j >= b && j - k > 1 && pk - lmin >= T.sylThr)) continue;
        if (k - last < T.minSyl) continue;
        n++; last = k;
    }
    return Math.max(1, n);
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

    // 2) bridge very short gaps (stop closures inside a word)
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
    var maxSyl = Math.round(lerp(T.maxSylHi, T.maxSylLo, ws));
    var pre = 9, post = 18; // edge extension limits in frames (45 / 90 ms)
    var lvl = F.floor + Math.min(6, range * 0.12);
    var list = [];
    var useAi = P.ai && asrList && asrList.length;
    if (useAi) {
        list = asrPieces(eDb, thr, lvl, hop);
    } else {
        for (r = 0; r < keep.length; r++) {
            var a = keep[r][0], b = keep[r][1];
            var cuts = [];
            // a word gap has to dip close to the noise floor (a fricative or a stop inside a word doesn't)
            hullSplit(eDb, a, b, wThr, minW, cuts, 0, F.floor + lerp(T.ceilLo, T.ceilHi, ws) * Math.max(0.5, range / 50));
            cuts.sort(function (x, y) { return x - y; });
            var edges = [a].concat(cuts).concat([b]);
            for (k = 0; k < edges.length - 1; k++) {
                list.push({ a: edges[k], b: edges[k + 1], gapL: k == 0, gapR: k == edges.length - 2 });
            }
        }
        // a word needs a vowel: merge pieces without a strong 300-3500 Hz nucleus
        list = mergeWeak(list, bDb, F.btop, eDb);
        // connected speech: pieces with too many syllables are several words glued together
        list = splitLong(list, eDb, bDb, maxSyl);
    }

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

    var sThr = lerp(T.sThrHi, T.sThrLo, ss), minS = Math.round(lerp(T.minSHi, T.minSLo, ss) / 5);
    var noiseAmp = Math.sqrt(Math.pow(10, F.floor / 10));
    words = [];
    for (k = 0; k < list.length && k < 64; k++) {
        var L = list[k];
        var hue = (0.56 + k * 0.618034) % 1;
        var s0 = L.ea * hop, s1 = Math.min(nFrames, L.eb * hop);
        // sample-accurate trim of silence before the first sound / after the tail
        if (L.gapL) s0 = refineOnset(s0, s1, noiseAmp);
        if (L.gapR) s1 = refineTail(s0, s1, noiseAmp);
        var word = mkSlice(s0, s1, "word", k, hue);
        word.text = L.text || "";
        splitWord(word, L, bDb, sThr, minS, hop);
        words.push(word);
    }
    if (sel && words.indexOf(sel) < 0) sel = words.length ? words[0] : null;
    if (!sel && words.length) sel = words[0];
}

// pieces with more syllables than maxSyl get split at their deepest energy valley
function splitLong(list, eDb, bDb, maxSyl) {
    var maxMs = lerp(T.maxMsHi, T.maxMsLo, clamp(P.wsens / 100, 0, 1));
    var out = [], stack = list.slice(0).reverse(), guard = 0;
    while (stack.length && guard++ < 500) {
        var L = stack.pop();
        var n = sylCount(bDb, L.a, L.b);
        if ((n <= maxSyl && (L.b - L.a) * 5 <= maxMs) || L.b - L.a < 2 * T.minSyl) { out.push(L); continue; }
        var v = valley(eDb, L.a, L.b, T.minSyl);
        if (v.k < 0) { out.push(L); continue; }
        // prefer the syllable valley nearest the middle when energy dips are equally shallow
        stack.push({ a: v.k, b: L.b, gapL: false, gapR: L.gapR });
        stack.push({ a: L.a, b: v.k, gapL: L.gapL, gapR: false });
    }
    return out;
}

// first real sound in the slice: 1 ms windows, -onsetDb below the local peak (or above noise)
function refineOnset(s, e, noiseAmp) {
    var span = Math.min(e - s, Math.round(sr * 0.3));
    var win = Math.max(8, Math.round(sr * 0.001));
    if (span < win * 6) return s;
    var arr = new Buffer(BUF).peek(1, s, span);
    if (!arr || typeof arr == "number") return s;
    var nw = Math.floor(span / win), rms = [], mx = 0, q, j, acc, mean;
    for (q = 0; q < nw; q++) {
        acc = 0; mean = 0;
        for (j = 0; j < win; j++) mean += arr[q * win + j];
        mean /= win;
        for (j = 0; j < win; j++) { var v = arr[q * win + j] - mean; acc += v * v; }
        rms[q] = Math.sqrt(acc / win);
        if (rms[q] > mx) mx = rms[q];
    }
    if (mx <= 0) return s;
    var th = Math.max(mx * Math.pow(10, -T.onsetDb / 20), noiseAmp * normGainGuess() * 2.5);
    for (q = 0; q < nw; q++) if (rms[q] > th) break;
    if (q >= nw) return s;
    return s + Math.max(0, q - 8) * win;
}

function refineTail(s, e, noiseAmp) {
    var span = Math.min(e - s, Math.round(sr * 0.3));
    var win = Math.max(8, Math.round(sr * 0.002));
    if (span < win * 6) return e;
    var st = e - span;
    var arr = new Buffer(BUF).peek(1, st, span);
    if (!arr || typeof arr == "number") return e;
    var nw = Math.floor(span / win), rms = [], mx = 0, q, j, acc;
    for (q = 0; q < nw; q++) {
        acc = 0;
        for (j = 0; j < win; j++) { var v = arr[q * win + j]; acc += v * v; }
        rms[q] = Math.sqrt(acc / win);
        if (rms[q] > mx) mx = rms[q];
    }
    if (mx <= 0) return e;
    var th = Math.max(mx * Math.pow(10, -40 / 20), noiseAmp * normGainGuess() * 1.5);
    for (q = nw - 1; q >= 0; q--) if (rms[q] > th) break;
    if (q < 0) return e;
    return Math.min(e, st + (q + 1) * win + Math.round(sr * 0.015));
}

// features are computed before normalize: the buffer may already be normalized when peeked
function normGainGuess() { return 1; }

// parts (1-3) by syllable valleys; the rest slice starts at the cut nearest the middle
function splitWord(word, L, bDb, sThr, minS, hop) {
    var sc = [];
    hullSplit(bDb, L.a, L.b, sThr, minS, sc, 0);
    sc.sort(function (x, y) { return x - y; });
    var cuts = [];
    for (var q = 0; q < sc.length; q++) {
        var c = sc[q] * hop + Math.floor(hop / 2);
        if (c > word.s + sr * 0.04 && c < word.e - sr * 0.04) cuts.push(c);
    }
    var len = word.e - word.s, mid = word.s + len / 2;
    if (!cuts.length && ms(len) >= T.restMinMs) {
        // no syllable valley: deepest dip in the middle 30-70 %, else the middle itself
        var fa = Math.floor((word.s + len * 0.3) / hop), fb = Math.floor((word.s + len * 0.7) / hop), best = -1, bv = 1e9;
        for (var f = fa; f < fb && f < bDb.length; f++) if (bDb[f] < bv) { bv = bDb[f]; best = f; }
        cuts.push(best >= 0 ? best * hop + Math.floor(hop / 2) : Math.round(mid));
    }
    // at most 3 parts: keep the 2 cuts closest to even thirds
    while (cuts.length > 2) {
        var bi = 0, bl = 1e20, se = [word.s].concat(cuts).concat([word.e]);
        for (var k = 1; k < se.length - 1; k++) { var l = se[k + 1] - se[k - 1]; if (l < bl) { bl = l; bi = k - 1; } }
        cuts.splice(bi, 1);
    }
    word.cuts = cuts;
    word.np = cuts.length + 1;
    word.rest = null;
    if (cuts.length) {
        var rc = cuts[0], bd = 1e20;
        for (var j = 0; j < cuts.length; j++) if (Math.abs(cuts[j] - mid) < bd) { bd = Math.abs(cuts[j] - mid); rc = cuts[j]; }
        var r = mkSlice(rc, word.e, "rest", word.wi, word.hue);
        r.frac = (rc - word.s) / len;
        word.rest = r;
    }
}

// ---------------------------------------------------------------- AI words
// Speech recognition gives word onsets (+-80 ms); each boundary is then
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
    var first = starts[0];
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
        var pc0 = { a: ta, b: tb, gapL: ta > a || k == 0, gapR: tb < b || k == W.length - 1, text: W[k].w };
        if (k == 0 || k == W.length - 1) dropIslands(pc0, eDb, thr, k == 0, k == W.length - 1);
        out.push(pc0);
    }
    // drop silent phantoms, glue fragments shorter than 35 ms to a neighbour
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
    // info / busy are transient: keep the engine state (starting / ready)
    if (st == "busy") asrState = "ready";
    else if (st != "info") asrState = st;
    var msg = a.slice(1).join(" ");
    if (st == "ready") { installing = 0; installWarn.cancel(); outlet(1, "ai", 2); if (P.ai) { setStatus("AI words ready" + (msg ? " - " + msg : "")); if (feat && !asrList) sendAsr(); } }
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
    setStatus("AI words: one-time install of the offline speech engine (1-3 min)...");
    outlet(2, "node", "script", "npm", "install");
    installWarn.schedule(240000);
}

function aistart() {
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
    for (var k = 1; k + 2 < a.length; k += 3) {
        var w = String(a[k + 2]).toLowerCase();
        if (w.length) list.push({ t: Number(a[k]), l: Number(a[k + 1]), w: w });
    }
    if (!list.length) { asrList = []; setStatus("AI heard no words - using acoustic chop"); return; }
    asrList = list;
    segment(); refreshAll(); summary();
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
            if (!voiced(L)) def += 6;
            if (L.b - L.a < minF) def += (minF - (L.b - L.a)) * 0.5 + 1;
            if (def > wScore) { wScore = def; worst = k; }
        }
        if (worst < 0) break;
        // merge towards the neighbour with the smaller (or shallower) gap
        var cur = list[worst], left = worst > 0 ? list[worst - 1] : null, right = worst < list.length - 1 ? list[worst + 1] : null;
        var gl = left ? cur.a - left.b : 1e9, gr = right ? right.a - cur.b : 1e9;
        // a click / breath / button noise standing apart from the words is dropped, never glued on:
        // gluing it to the first word is what made words start with a silent gap
        if (Math.min(gl, gr) * 5 >= T.dropGapMs && (!voiced(cur) || btop - pieceMax(bDb, cur.a, cur.b) > T.vowelDb || (cur.b - cur.a) * 5 < 50)) { list.splice(worst, 1); continue; }
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

// clicks / breaths sitting before (or after) a word inside the same piece, separated by a pause: cut them off
function dropIslands(pc, eDb, thr, lead, tail) {
    var runs = [], on = false, st = 0, k, gapF = Math.round(T.dropGapMs / 5);
    for (k = pc.a; k < pc.b; k++) {
        if (!on && eDb[k] > thr) { on = true; st = k; }
        else if (on && eDb[k] < thr - 3) { on = false; runs.push([st, k]); }
    }
    if (on) runs.push([st, pc.b]);
    while (lead && runs.length > 1 && runs[1][0] - runs[0][1] >= gapF && !voiced({ a: runs[0][0], b: runs[0][1] })) { runs.shift(); pc.a = runs[0][0]; pc.gapL = true; }
    while (tail && runs.length > 1 && runs[runs.length - 1][0] - runs[runs.length - 2][1] >= gapF && !voiced({ a: runs[runs.length - 1][0], b: runs[runs.length - 1][1] })) { runs.pop(); pc.b = runs[runs.length - 1][1]; pc.gapR = true; }
}

// a word has a voiced (periodic) nucleus; clicks, breaths and lone "s" / "t" don't
function voiced(L) {
    if (L.vc === undefined) L.vc = detectPitch(L.a * feat.hop, L.b * feat.hop) > 0 ? 1 : 0;
    return L.vc;
}

function mkSlice(s, e, kind, wi, hue) {
    return { s: Math.max(0, Math.round(s)), e: Math.round(e), kind: kind, wi: wi, hue: hue,
             pitch: undefined, env: null, cloud: null };
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

// sustain region for Cloud: the loudest voiced stretch (vowel) of the slice, in samples
function cloudRegion(sl) {
    if (sl.cloud) return sl.cloud;
    var F = feat, s = sl.s, e = sl.e;
    if (!F) return (sl.cloud = [s, e]);
    var fa = Math.floor(s / F.hop), fb = Math.min(F.nf, Math.max(fa + 1, Math.floor(e / F.hop))), best = fa, bv = -1e9, k;
    for (k = fa; k < fb; k++) if (F.bDb[k] > bv) { bv = F.bDb[k]; best = k; }
    var a = best, b = best + 1;
    while (a > fa && F.bDb[a - 1] > bv - 6) a--;
    while (b < fb && F.bDb[b] > bv - 6) b++;
    var minF = Math.round(0.08 * sr / F.hop);
    while (b - a < minF && (a > fa || b < fb)) { if (a > fa) a--; if (b < fb) b++; }
    sl.cloud = [Math.max(s, a * F.hop), Math.min(e, b * F.hop)];
    return sl.cloud;
}

// ---------------------------------------------------------------- pitch (YIN)
function ensurePitch(sl) {
    if (sl.pitch !== undefined) return sl.pitch;
    sl.pitch = detectPitch(sl.s, sl.e);
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
    var dp = [1], run = 0, tau, diff, acc;
    for (tau = 1; tau <= tMax + 1; tau++) {
        acc = 0;
        for (q = 0; q < W; q++) { diff = x[q] - x[q + tau]; acc += diff * diff; }
        run += acc;
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

// nearest allowed note to m: key 0 = Live's scale, 1..12 = that single note (C..B)
function nearestAllowed(m) {
    var pcs = [];
    if (P.key >= 1) pcs = [Math.round(P.key) - 1];
    else for (var q = 0; q < scaleInts.length; q++) pcs.push((scaleRoot + scaleInts[q]) % 12);
    var best = Math.round(m), bd = 1e9;
    for (var o = -1; o <= 1; o++) {
        for (var k = 0; k < pcs.length; k++) {
            var cand = (Math.floor(m / 12) + o) * 12 + pcs[k];
            if (Math.abs(cand - m) < bd) { bd = Math.abs(cand - m); best = cand; }
        }
    }
    return best;
}

// ---------------------------------------------------------------- text labels
// Croatian / English syllables: vowels, plus syllabic r between consonants (prst, vrt)
function syllables(t) {
    var V = "aeiouy", nuc = [], i, ch;
    t = String(t);
    for (i = 0; i < t.length; i++) {
        ch = t.charAt(i).toLowerCase();
        if (V.indexOf(ch) >= 0) nuc.push(i);
        else if (ch == "r") {
            var pv = i > 0 ? t.charAt(i - 1).toLowerCase() : "", nx = i < t.length - 1 ? t.charAt(i + 1).toLowerCase() : "";
            if ((pv === "" || V.indexOf(pv) < 0) && (nx === "" || V.indexOf(nx) < 0) && t.length > 1) nuc.push(i);
        }
    }
    // collapse adjacent vowels that form one nucleus (ie in "vrijeme" counts as i + je)
    if (nuc.length < 2) return [t];
    var cut = [];
    for (i = 0; i < nuc.length - 1; i++) {
        var a = nuc[i], b = nuc[i + 1], cl = b - a - 1;
        if (cl <= 0) cut.push(b);
        else if (cl == 1) cut.push(a + 1);
        else cut.push(a + 2);
    }
    var out = [], st = 0;
    for (i = 0; i < cut.length; i++) { out.push(t.substring(st, cut[i])); st = cut[i]; }
    out.push(t.substring(st));
    return out;
}

function restText(t, frac) {
    var sy = syllables(t);
    if (sy.length < 2) {
        var k = clamp(Math.round(t.length * frac), 1, Math.max(1, t.length - 1));
        return t.substring(k);
    }
    var best = 1, bd = 1e9;
    for (var j = 1; j < sy.length; j++) {
        var f = j / sy.length;
        if (Math.abs(f - frac) < bd) { bd = Math.abs(f - frac); best = j; }
    }
    return sy.slice(best).join("");
}

function label(sl) {
    var w = words[sl.wi];
    if (!w) return "";
    if (sl.kind == "word") return w.text ? w.text : "W" + (sl.wi + 1);
    if (w.text) return "-" + restText(w.text, sl.frac || 0.5);
    return (sl.wi + 1) + "b";
}

// ---------------------------------------------------------------- pad surface
// pad index p = row*8 + col, row 0 = bottom row (Push y = 7 - row)
function rc(row, col) { return row * 8 + col; }

function keyNoteAt(row, col) {
    // in-key layout like Push: columns = scale steps, every row up = a 4th (3 steps)
    var n = scaleInts.length, d = col + 3 * row;
    var base = HOME + scaleRoot + 12 * P.octave;
    while (base < KEY0) base += 12;
    var note = base + Math.floor(d / n) * 12 + scaleInts[d % n];
    return note > 127 ? -1 : note;
}

function buildSurface() {
    var k, row, col;
    for (k = 0; k < 64; k++) surf[k] = null;
    if (P.layout == 0) {
        for (row = 7; row >= 0; row -= 2) {
            var q = (7 - row) / 2;
            for (col = 0; col < 8; col++) {
                var wi = q * 8 + col;
                surf[rc(row, col)] = { t: "word", k: wi };
                surf[rc(row - 1, col)] = { t: "rest", k: wi };
            }
        }
        return;
    }
    for (col = 0; col < 8; col++) {
        surf[rc(7, col)] = { t: "word", k: P.page * 8 + col };
        surf[rc(6, col)] = { t: "rest", k: P.page * 8 + col };
    }
    if (P.layout == 1) {
        for (row = 0; row < 6; row++) for (col = 0; col < 8; col++) surf[rc(row, col)] = { t: "key", n: keyNoteAt(row, col) };
    } else {
        for (row = 2; row < 6; row++) for (col = 0; col < 8; col++) surf[rc(row, col)] = { t: "step", i: (5 - row) * 8 + col };
        for (col = 0; col < 8; col++) surf[rc(1, col)] = { t: "spage", i: col };
        for (col = 0; col < 4; col++) surf[rc(0, col)] = { t: "sres", i: col };
        for (col = 4; col < 8; col++) surf[rc(0, col)] = { t: "slen", i: col - 4 };
    }
}

function sliceOfRole(r) {
    if (!r) return null;
    if (r.t == "word") return words[r.k] || null;
    if (r.t == "rest") return (words[r.k] && words[r.k].rest) ? words[r.k].rest : null;
    return null;
}

function noteOfRole(r) {
    if (!r) return -1;
    if (r.t == "word") return r.k < NWORDS ? r.k : -1;
    if (r.t == "rest") return r.k < NWORDS ? REST0 + r.k : -1;
    if (r.t == "key") return r.n;
    return -1;
}

function sliceForNote(n) {
    if (n < 0 || n >= KEY0) return null;
    if (n < REST0) return words[n] || null;
    var w = words[n - REST0];
    return w ? w.rest : null;
}

// pad message: pad <p> <type> <hue> <label> [env...]
//   types: 0 empty, 1 word, 2 rest, 3 key, 4 key root, 5 key (no slice), 6 step on, 7 step off,
//          8 step outside clip, 9 option on, 10 option off, 11 playhead
function sendUI() {
    outlet(1, "begin");
    var selPad = -1;
    for (var k = 0; k < 64; k++) {
        var r = surf[k];
        if (!r) { outlet(1, "pad", k, 0, 0, "-"); continue; }
        if (r.t == "word" || r.t == "rest") {
            var sl = sliceOfRole(r);
            if (!sl) { outlet(1, "pad", k, 0, 0, "-"); continue; }
            if (sl === sel) selPad = k;
            outlet(1, ["pad", k, r.t == "word" ? 1 : 2, sl.hue, label(sl)].concat(sliceEnv(sl)));
        } else if (r.t == "key") {
            if (r.n < 0) { outlet(1, "pad", k, 0, 0, "-"); continue; }
            var root = (((r.n - scaleRoot) % 12) + 12) % 12 == 0;
            outlet(1, "pad", k, sel ? (root ? 4 : 3) : 5, sel ? sel.hue : 0, noteName(r.n));
        } else if (r.t == "step") {
            var gi = seq.page * 32 + r.i, beat = gi * SEQ_RES[seq.res];
            if (beat >= seq.len) outlet(1, "pad", k, 8, 0, "");
            else if (seq.pos == gi) outlet(1, "pad", k, 11, 0, "");
            else {
                var sn = seq.steps[r.i];
                if (sn !== undefined) {
                    var ss = sliceForNote(sn);
                    outlet(1, "pad", k, 6, ss ? ss.hue : 0, ss ? label(ss) : String(sn));
                } else outlet(1, "pad", k, 7, 0, (r.i % 4 == 0) ? String(Math.floor(gi * SEQ_RES[seq.res] / 4) + 1) + "." + ((gi * SEQ_RES[seq.res]) % 4 + 1) : "");
            }
        } else if (r.t == "spage") {
            var pageBeats = 32 * SEQ_RES[seq.res];
            outlet(1, "pad", k, r.i == seq.page ? 9 : (r.i * pageBeats < seq.len ? 10 : 0), 0, "P" + (r.i + 1));
        } else if (r.t == "sres") {
            outlet(1, "pad", k, r.i == seq.res ? 9 : 10, 0, ["1/32", "1/16", "1/8", "1/4"][r.i]);
        } else if (r.t == "slen") {
            outlet(1, "pad", k, SEQ_LEN[r.i] * 4 == seq.len ? 9 : 10, 0.08, SEQ_LEN[r.i] + " bar");
        }
    }
    outlet(1, "selpad", selPad);
    var reg = ["regions"];
    for (k = 0; k < words.length; k++) reg.push(frac(words[k].s), frac(words[k].e), words[k].hue, label(words[k]));
    outlet(1, reg);
    var mk = ["marks"];
    for (k = 0; k < words.length; k++) for (var q = 0; q < words[k].cuts.length; q++) mk.push(frac(words[k].cuts[q]));
    outlet(1, mk);
    if (sel) outlet(1, "sel", frac(sel.s), frac(sel.e)); else outlet(1, "sel", -1, -1);
    outlet(1, "mode", P.layout);
    outlet(1, "refresh");
}

function sendWave() {
    outlet(1, ["wave"].concat(waveBins));
}

function frac(s) { return nFrames > 0 ? Math.round((s / nFrames) * 10000) / 10000 : 0; }

// ---------------------------------------------------------------- input from pads / MIDI
// MIDI from the track (Push in note mode, keyboards, clips playing back)
function note(n, vel) {
    n = Number(n); vel = Number(vel);
    if (vel > 0) noteOn(n, vel); else noteOff(n);
}

// pads: on-screen grid or Push pads taken over by VoChop
function padclick(pd, v) {
    pd = Number(pd); v = Number(v);
    if (pd < 0 || pd > 63) return;
    var r = surf[pd];
    if (v > 0) {
        if (!r) return;
        if (r.t == "step") { if (P.layout == 2) seqToggle(r.i); return; }
        if (r.t == "spage") { seq.page = r.i; seqRefresh(); return; }
        if (r.t == "sres") { seq.res = r.i; seq.page = 0; seqRefresh(); return; }
        if (r.t == "slen") { seqSetLen(SEQ_LEN[r.i] * 4); return; }
        var n = noteOfRole(r);
        if (n < 0) {
            // words beyond 32 (no MIDI note): play directly
            var sl = sliceOfRole(r);
            if (sl) { sel = sl; triggerChop(sl, 1000 + pd, v, pd); }
            return;
        }
        padNote[pd] = n;
        noteOn(n, v);
        recOn(n, v);
    } else {
        var on = padNote[pd];
        padNote[pd] = -1;
        if (on >= 0) { noteOff(on); recOff(on); }
        else noteOff(1000 + pd);
    }
}

function noteOn(n, vel) {
    if (!nFrames || !words.length) {
        if (!recording) setStatus("Nothing to play yet - record or drop audio first");
        return;
    }
    if (n < KEY0) {
        var sl = sliceForNote(n);
        if (!sl) return;
        var changed = sel !== sl;
        sel = sl;
        triggerChop(sl, n, vel, padsForNote(n));
        var pt = ensurePitch(sl);
        setInfo(label(sl) + "   " + fmtSec(sl.e - sl.s) + (pt > 0 ? "   ~" + noteName(pt) : "") + "   note " + n);
        if (changed && P.layout == 1) sendUI();
        else if (changed) outlet(1, "selpad", padOfSlice(sl));
        return;
    }
    var src = sel || words[0];
    triggerKey(src, n, vel, padsForNote(n));
    setInfo(label(src) + "  ->  " + noteName(n));
}

function noteOff(n) {
    var t = now();
    for (var k = 0; k < NV; k++) {
        var v = voices[k];
        if (v.busy && v.note == n && v.held) {
            v.held = 0;
            if (v.keep) {
                voiceMsg(k, "hold", 0);
                v.relT = t;
                hitPads(v.pad, 0);
            }
        }
    }
}

function padsForNote(n) {
    var out = [];
    for (var k = 0; k < 64; k++) if (noteOfRole(surf[k]) == n) out.push(k);
    return out;
}

function padOfSlice(sl) {
    for (var k = 0; k < 64; k++) if (surf[k] && sliceOfRole(surf[k]) === sl) return k;
    return -1;
}

function allNotesOff() {
    for (var k = 0; k < NV; k++) {
        if (voices[k].busy) {
            killVoice(k);
            voices[k].busy = 0; voices[k].held = 0;
            hitPads(voices[k].pad, 0);
        }
    }
}

// ---------------------------------------------------------------- voices
function voiceMsg(k, name, v) { outlet(0, k, "g", name, v); }

function killVoice(k) {
    voices[k].kill++;
    voiceMsg(k, "kill", voices[k].kill);
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

function repeatMs() {
    var b = RATE_BEATS[clamp(Math.round(P.rate), 0, RATE_BEATS.length - 1)];
    return b * 60000 / clamp(tempo, 20, 999);
}

// word / rest pads: classic chopper (choke by default)
function triggerChop(sl, n, vel, pads, oneShot) {
    if (P.choke) {
        for (var c = 0; c < NV; c++) if (voices[c].busy && voices[c].chop) {
            killVoice(c);
            voices[c].held = 0; voices[c].keep = 0; voices[c].chop = 0; voices[c].relT = now();
            hitPads(voices[c].pad, 0);
        }
    }
    var mode = oneShot ? 0 : [0, 0, 1, 3][clamp(Math.round(P.pads), 0, 3)];
    var semis = P.pitch + bendSemis, tune = null;
    var pt = ensurePitch(sl);
    if (P.atune > 0 && pt > 0) tune = { hz: mtof(nearestAllowed(pt + semis)), amt: P.atune };
    startVoice(sl, n, vel, Math.pow(2, clamp(semis, -48, 48) / 12), mode, !oneShot && P.pads != 0, tune, pads, 1);
}

// keys: the selected slice, tuned to the played note (nearest octave around C5-B5)
function triggerKey(sl, n, vel, pads) {
    var pt = ensurePitch(sl);
    var oct = Math.floor((n - HOME) / 12) * 12, pc = ((n % 12) + 12) % 12;
    var mode = [2, 1, 3, 0][clamp(Math.round(P.keys), 0, 3)];
    var rate = 1, tune = null;
    if (pt > 0) {
        var m = pt + P.pitch + bendSemis;
        var near = m + ((((pc - Math.round(m)) % 12) + 18) % 12 - 6) + (Math.round(m) - m);
        var target = near + oct;
        tune = { hz: mtof(target), amt: 100 };
        // big jumps: move most of the octave with the playback rate, retune~ does the rest
        if (Math.abs(target - pt) > 7) rate = Math.pow(2, Math.round((target - pt) / 12) * 12 / 12);
    } else {
        rate = Math.pow(2, clamp((((pc + 6) % 12) - 6) + oct + P.pitch, -36, 36) / 12);
    }
    startVoice(sl, n, vel, rate, mode, mode != 0, tune, pads, 0);
}

function startVoice(sl, n, vel, rate, mode, keep, tune, pads, chop) {
    var vi = allocVoice(), v = voices[vi];
    if (v.busy) hitPads(v.pad, 0);
    var s0 = ms(sl.s), s1 = ms(sl.e);
    if (s1 - s0 < 3) return;
    var cr = cloudRegion(sl);
    var vs = clamp(P.vel / 100, 0, 1);
    var amp = ((1 - vs) + vs * Math.pow(clamp(vel, 1, 127) / 127, 1.6)) * normGain * 0.8;
    var pan = ((vi % 2) ? 1 : -1) * clamp(P.spread / 100, 0, 1) * (0.35 + 0.65 * ((vi * 0.37) % 1));
    var ang = (pan + 1) * Math.PI / 4;
    if (tune) { outlet(0, vi, "t", tune.hz); outlet(0, vi, "c", tune.amt); outlet(0, vi, "r", 1); }
    else { outlet(0, vi, "r", 0); outlet(0, vi, "t", 0); }
    outlet(0, vi, "pn", Math.cos(ang), Math.sin(ang));
    voiceMsg(vi, "s0", s0);
    voiceMsg(vi, "s1", s1);
    voiceMsg(vi, "cs0", ms(cr[0]));
    voiceMsg(vi, "cs1", ms(cr[1]));
    voiceMsg(vi, "spd", rate);
    voiceMsg(vi, "mode", mode);
    voiceMsg(vi, "rev", (P.reverse && chop) ? 1 : 0);
    voiceMsg(vi, "amp", amp);
    voiceMsg(vi, "att", Math.max(0.5, P.attack));
    voiceMsg(vi, "rel", Math.max(5, P.release));
    voiceMsg(vi, "gsz", clamp(P.grain, 20, 500));
    voiceMsg(vi, "rlen", Math.max(15, repeatMs() * rate));
    voiceMsg(vi, "fade", mode == 0 ? 5 : 3);
    voiceMsg(vi, "hold", 1);
    v.trig++;
    voiceMsg(vi, "trig", v.trig);
    v.busy = 1; v.note = n; v.held = 1; v.t = now(); v.relT = 0; v.keep = keep ? 1 : 0; v.pad = pads; v.chop = chop;
    hitPads(pads, 1);
    outlet(1, "play", frac(sl.s), frac(sl.e));
}

// end of a voice: "vend <voice> <trigger id>" (a late 'done' of a stolen note is ignored)
function vend(k, id) {
    k = Number(k);
    var v = voices[k];
    if (!v || !v.busy) return;
    if (id !== undefined && Number(id) != v.trig) return;
    v.busy = 0; v.held = 0;
    hitPads(v.pad, 0);
}

function hitPads(pads, on) {
    if (pads === undefined || pads === null) return;
    if (typeof pads == "number") pads = [pads];
    for (var q = 0; q < pads.length; q++) {
        var pd = pads[q];
        if (pd >= 0 && pd <= 63) outlet(1, "hit", pd, on ? 1 : 0);
    }
}

// click on the waveform: select a word and audition it
function waveclick(f) {
    f = Number(f);
    if (!nFrames) return;
    var s = f * nFrames, pick = null;
    for (var k = 0; k < words.length; k++) if (s >= words[k].s && s < words[k].e) { pick = words[k]; break; }
    if (!pick) return;
    sel = pick;
    triggerChop(pick, -999, 100, padOfSlice(pick), true);
    for (var q = 0; q < NV; q++) if (voices[q].note == -999) voices[q].held = 0;
    setInfo("Selected " + label(pick) + " - the keys play this word");
    sendUI();
}

// ---------------------------------------------------------------- clips
// the track is followed by id, its path is read fresh (tracks can be inserted / moved)
function trackApi() {
    if (!trackId) findTrack();
    if (!trackId) return null;
    if (!trApi) trApi = new LiveAPI(null, "id " + trackId);
    trackPath = String(trApi.unquotedpath || trackPath);
    return trApi;
}

function song() {
    if (!songApi) songApi = new LiveAPI(null, "live_set");
    return songApi;
}

function clipAt(slotIdx) {
    if (slotIdx < 0 || !trackPath) return null;
    var cs = new LiveAPI(null, trackPath + " clip_slots " + slotIdx);
    if (Number(cs.get("has_clip")) != 1) return null;
    return new LiveAPI(null, trackPath + " clip_slots " + slotIdx + " clip");
}

// the clip to record / sequence into: playing clip, else the highlighted slot of this track
function targetClip(create) {
    var tr = trackApi();
    if (!tr) return null;
    var ps = Number(tr.get("playing_slot_index"));
    var c = clipAt(ps);
    if (c) return c;
    var hs = -1;
    try {
        var hv = new LiveAPI(null, "live_set view highlighted_clip_slot");
        var hp = String(hv.unquotedpath || "");
        if (hp.indexOf(trackPath + " clip_slots ") == 0) hs = Number(hp.substring((trackPath + " clip_slots ").length));
    } catch (e) { hs = -1; }
    c = clipAt(hs);
    if (c) return c;
    if (!create) return null;
    var slot = hs;
    if (slot < 0) {
        var ns = tr.getcount("clip_slots");
        for (var k = 0; k < ns; k++) { if (!clipAt(k)) { slot = k; break; } }
    }
    if (slot < 0) return null;
    var csa = new LiveAPI(null, trackPath + " clip_slots " + slot);
    csa.call("create_clip", seq.len);
    c = new LiveAPI(null, trackPath + " clip_slots " + slot + " clip");
    c.set("name", "VoChop");
    return c;
}

function addNotes(clip, notes) {
    var ok = false;
    try {
        clip.call("add_new_notes", { notes: notes });
        ok = true;
    } catch (e1) { ok = false; }
    if (!ok) {
        try {
            clip.call("set_notes");
            clip.call("notes", notes.length);
            for (var k = 0; k < notes.length; k++)
                clip.call("note", notes[k].pitch, notes[k].start_time.toFixed(4), notes[k].duration.toFixed(4), notes[k].velocity, 0);
            clip.call("done");
            ok = true;
        } catch (e2) { post("VoChop: add notes failed " + e2 + "\n"); }
    }
    return ok;
}

function getNotes(clip, fromPitch, span, fromTime, timeSpan) {
    try {
        var d = parseJson(clip.call("get_notes_extended", fromPitch, span, fromTime, timeSpan));
        return (d && d.notes) ? d.notes : [];
    } catch (e) { return []; }
}

// ---- recording pad presses into the clip (pads taken over by VoChop never reach the track)
// the track is armed (checked by the caller): the clip records, or Session Record overdubs it
function recArmed(clip) {
    try {
        if (Number(clip.get("is_recording")) == 1) return true;
        return Number(song().get("session_record")) == 1 && Number(clip.get("is_playing")) == 1;
    } catch (e) { return false; }
}

function recOn(n, vel) {
    // cheap check first: Live only records into an armed track
    var tr = null;
    try { tr = trackApi(); if (!tr || Number(tr.get("arm")) != 1) return; } catch (e) { return; }
    var clip = targetClip(false);
    if (!clip || !recArmed(clip)) return;
    var pos = Number(clip.get("playing_position"));
    recNotes[n] = { clip: Number(clip.id), pos: pos, t: now(), vel: vel };
}

function recOff(n) {
    var r = recNotes[n];
    if (!r) return;
    delete recNotes[n];
    var clip = new LiveAPI(null, "id " + r.clip);
    var dur = Math.max(0.0625, (now() - r.t) / 60000 * tempo);
    var nt = { pitch: n, start_time: Math.max(0, r.pos), duration: dur, velocity: r.vel, mute: 0 };
    addNotes(clip, [nt]);
    recPending.push({ clip: r.clip, note: nt });
    recTaskCheck.cancel(); recTaskCheck.schedule(600);
}

// a clip that is still being recorded can drop notes added by the API: re-add them afterwards
function recCheck() {
    var keep = [];
    for (var k = 0; k < recPending.length; k++) {
        var r = recPending[k], clip = new LiveAPI(null, "id " + r.clip);
        if (!clip || Number(clip.id) == 0) continue;
        if (Number(clip.get("is_recording")) == 1) { keep.push(r); continue; }
        var nt = r.note, found = getNotes(clip, nt.pitch, 1, Math.max(0, nt.start_time - 0.01), 0.02);
        if (!found.length) addNotes(clip, [nt]);
    }
    recPending = keep;
    if (recPending.length) recTaskCheck.schedule(600);
}

// ---- step sequencer
function seqEnter() {
    tickSlot = -2; tickClip = null;
    seqRefresh();
    seqTask.cancel();
    seqTask.interval = 80;
    seqTask.repeat();
}

function seqStepBeat(i) { return (seq.page * 32 + i) * SEQ_RES[seq.res]; }

function seqRefresh() {
    seq.steps = [];
    var clip = targetClip(false);
    if (clip) {
        seq.len = Number(clip.get("loop_end")) - Number(clip.get("loop_start"));
        if (!(seq.len > 0)) seq.len = 8;
        var st = seqStepBeat(0), span = 32 * SEQ_RES[seq.res];
        var notes = getNotes(clip, 0, KEY0, st, span);
        for (var k = 0; k < notes.length; k++) {
            var i = Math.round((Number(notes[k].start_time) - st) / SEQ_RES[seq.res]);
            if (i >= 0 && i < 32 && seq.steps[i] === undefined) seq.steps[i] = Number(notes[k].pitch);
        }
    }
    buildSurface(); sendUI();
}

function seqToggle(i) {
    var clip = targetClip(true);
    if (!clip) { setStatus("No clip slot free on this track"); return; }
    var beat = seqStepBeat(i), res = SEQ_RES[seq.res];
    if (beat >= seq.len) { setInfo("Step is past the clip end - pick a longer length in the bottom row"); return; }
    var ex = getNotes(clip, 0, KEY0, beat - 0.001, res);
    if (ex.length) {
        try { clip.call("remove_notes_extended", 0, KEY0, beat - 0.001, res); } catch (e) { }
    } else {
        if (sel && sel.wi >= NWORDS) { setInfo("Only words 1-32 can go into a clip"); return; }
        var n = sel ? (sel.kind == "word" ? sel.wi : REST0 + sel.wi) : 0;
        var steps = sel ? Math.max(1, Math.round((sel.e - sel.s) / sr * tempo / 60 / res)) : 1;
        addNotes(clip, [{ pitch: n, start_time: beat, duration: steps * res, velocity: 100, mute: 0 }]);
    }
    seqRefresh();
}

function seqSetLen(beats) {
    var clip = targetClip(true);
    if (!clip) return;
    try {
        clip.set("loop_end", Number(clip.get("loop_start")) + beats);
        clip.set("end_marker", Number(clip.get("loop_start")) + beats);
    } catch (e) { }
    seq.len = beats;
    seqRefresh();
}

function seqTick() {
    if (P.layout != 2) { seqTask.cancel(); return; }
    var pos = -1;
    try {
        var tr = trackApi();
        var ps = tr ? Number(tr.get("playing_slot_index")) : -1;
        if (ps != tickSlot) { tickSlot = ps; tickClip = ps >= 0 ? clipAt(ps) : null; }
        if (tickClip && Number(tickClip.get("is_playing")) == 1) pos = Number(tickClip.get("playing_position"));
    } catch (e) { tickSlot = -2; tickClip = null; }
    var st = -1;
    if (pos >= 0) {
        var gi = Math.floor(pos / SEQ_RES[seq.res]);
        if (Math.floor(gi / 32) == seq.page) st = gi;
    }
    if (st != seq.pos) { seq.pos = st; sendUI(); }
}

// ---------------------------------------------------------------- MIDI clip of the phrase
function makeclip(v) {
    if (Number(v) === 0) return;
    if (!words.length) { setStatus("Nothing to put in a clip yet"); return; }
    var bps = clamp(tempo, 20, 999) / 60, t0 = words[0].s, notes = [], k;
    for (k = 0; k < words.length && k < NWORDS; k++) {
        var st = Math.round(((words[k].s - t0) / sr) * bps * 4) / 4;
        var du = Math.max(0.25, Math.round(((words[k].e - words[k].s) / sr) * bps * 4) / 4);
        notes.push({ pitch: k, start_time: st, duration: du, velocity: 100, mute: 0 });
    }
    var end = notes[notes.length - 1].start_time + notes[notes.length - 1].duration;
    var len = Math.max(4, Math.ceil(end / 4) * 4);
    try {
        var tr = trackApi();
        if (!tr) { setStatus("Could not find this track"); return; }
        var nslots = tr.getcount("clip_slots"), slot = -1;
        for (k = 0; k < nslots; k++) if (!clipAt(k)) { slot = k; break; }
        if (slot < 0) { setStatus("No empty clip slot on this track"); return; }
        new LiveAPI(null, trackPath + " clip_slots " + slot).call("create_clip", len);
        var clip = new LiveAPI(null, trackPath + " clip_slots " + slot + " clip");
        clip.set("name", "VoChop phrase");
        addNotes(clip, notes);
        setStatus("MIDI clip created in slot " + (slot + 1) + " (" + notes.length + " words) - fire it!");
    } catch (e) {
        setStatus("Make Clip failed: " + e);
    }
}

// ---------------------------------------------------------------- Push parameter banks (display + buttons above it)
var BANKS = [
    ["Main", ["Layout", "Keys", "AutoTune", "Key", "Pitch", "Attack", "Release", "Volume"]],
    ["FX", ["Reverb", "Size", "Delay", "Time", "Feedback", "Crush", "Drive", "Cutoff"]],
    ["Chop", ["Pads", "Grain", "Rate", "Choke", "Spread", "Poly", "Words", "Syllables"]]
];
var BANK_BUTTONS = ["Rec", "Undo", "Layout", "Page", "OctDown", "OctUp", "Keys", "Choke"];

function bankmsg() {
    var a = arrayfromargs(arguments);
    if (String(a[0]) != "count") return;
    var have = Number(a[1]) || 0;
    for (var b = 0; b < BANKS.length; b++) {
        var m;
        if (b < have) {
            m = ["banks", "edit", b, BANKS[b][0]];
            for (var q = 0; q < 8; q++) m.push(q, BANKS[b][1][q]);
            m.push("@buttons");
            for (q = 0; q < 8; q++) m.push(q, BANK_BUTTONS[q]);
        } else {
            m = ["banks", "new", b, BANKS[b][0]].concat(BANKS[b][1]).concat(["@buttons"]).concat(BANK_BUTTONS);
        }
        outlet(2, m);
    }
}

// ---------------------------------------------------------------- own audio input (Audio From)
function inputsRefresh() {
    inIO = null; inTypes = []; inChans = [];
    try {
        var dev = new LiveAPI(null, "this_device");
        var n = dev.getcount("audio_inputs");
        post("VoChop: device audio inputs: " + n + "\n");
        if (n < 1) { outlet(2, "inmenu", "clear"); outlet(2, "inmenu", "append", "(no input - use VoChop Input)"); return; }
        inIO = new LiveAPI(null, "this_device audio_inputs " + (n - 1));
        var d = parseJson(inIO.get("available_routing_types"));
        inTypes = (d && d.available_routing_types) ? d.available_routing_types : [];
        outlet(2, "inmenu", "clear");
        var cur = parseJson(inIO.get("routing_type")), ci = 0;
        for (var k = 0; k < inTypes.length; k++) {
            outlet(2, "inmenu", "append", String(inTypes[k].display_name));
            if (cur && cur.routing_type && cur.routing_type.identifier == inTypes[k].identifier) ci = k;
        }
        outlet(2, "inmenu", "set", ci);
        chansRefresh();
    } catch (e) { post("VoChop: audio input routing not available: " + e + "\n"); }
}

function chansRefresh() {
    if (!inIO) return;
    var d = parseJson(inIO.get("available_routing_channels"));
    inChans = (d && d.available_routing_channels) ? d.available_routing_channels : [];
    outlet(2, "chmenu", "clear");
    var cur = parseJson(inIO.get("routing_channel")), ci = 0;
    for (var k = 0; k < inChans.length; k++) {
        outlet(2, "chmenu", "append", String(inChans[k].display_name));
        if (cur && cur.routing_channel && cur.routing_channel.identifier == inChans[k].identifier) ci = k;
    }
    outlet(2, "chmenu", "set", ci);
}

function setRouting(prop, item) {
    var tries = [
        function () { inIO.set(prop, JSON.stringify({ identifier: item.identifier })); },
        function () { inIO.set(prop, JSON.stringify(item)); },
        function () { var o = {}; o[prop] = { identifier: item.identifier }; inIO.set(prop, JSON.stringify(o)); },
        function () { inIO.set(prop, item.identifier); }
    ];
    for (var k = 0; k < tries.length; k++) {
        try { tries[k](); } catch (e) { }
        var cur = parseJson(inIO.get(prop));
        if (cur && cur[prop] && cur[prop].identifier == item.identifier) return true;
    }
    post("VoChop: could not set " + prop + " to " + item.display_name + "\n");
    return false;
}

function insel(idx) {
    idx = Number(idx);
    if (!inIO || !inTypes[idx]) { inputsRefresh(); return; }
    if (setRouting("routing_type", inTypes[idx])) setStatus("Audio from: " + inTypes[idx].display_name + " - press REC and speak");
    chansRefresh();
}

function chsel(idx) {
    idx = Number(idx);
    if (!inIO || !inChans[idx]) return;
    setRouting("routing_channel", inChans[idx]);
}

function pushstate(v) {
    setInfo(Number(v) ? "Push pads: VoChop layout (select another track to give them back)" : "Push pads back to Push");
}

function anything() {
    post("VoChop: unknown message " + messagename + "\n");
}
