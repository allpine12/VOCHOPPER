/*
  VoChop Input - records your mic into the VoChop instrument  ([js], ES5)
  Put "VoChop Input" on the audio track your microphone comes in on.
*/
autowatch = 0;
inlets = 1;
outlets = 2;    // 0: to the instrument bus, 1: local (record~, ui)

var link = 1, bufname = "", recording = 0, autoArm = 0, autoRec = 0, thr = -32, started = 0;
var lastLoud = 0, recStart = 0;

var helloTask = new Task(function () {
    if (!bufname) status("No VoChop on Link " + link + " - load it on a MIDI track");
}, this);

function status(s) { outlet(1, "status", String(s)); }
function now() { return new Date().getTime(); }

function start() {
    started = 1;
    hello();
}

function hello() {
    outlet(0, link, "hello");
    helloTask.cancel();
    helloTask.schedule(1200);
}

function lnk(v) {
    link = Math.max(1, Math.round(Number(v)));
    bufname = "";
    if (started) hello();
}

// messages from the instrument: <link> buf <name> | <link> rec <0/1> [name]
function bus() {
    var a = arrayfromargs(arguments);
    if (a.length < 2 || Number(a[0]) != link) return;
    var cmd = String(a[1]);
    if (cmd == "buf") {
        var first = !bufname;
        bufname = String(a[2]);
        if (first || !recording) status("Linked to VoChop (Link " + link + ") - press REC");
    } else if (cmd == "rec") {
        if (Number(a[2]) > 0) { if (a.length > 3) bufname = String(a[3]); startRec(); }
        else stopRec();
    }
}

// REC button on this device
function rec(v) {
    v = Number(v);
    if (!started) { outlet(1, "recbtn", 0); return; }
    if (!bufname) {
        status("No VoChop on Link " + link + " - load it on a MIDI track");
        outlet(1, "recbtn", recording);
        hello();
        return;
    }
    autoRec = 0;
    outlet(0, link, "recreq", v > 0 ? 1 : 0);
    outlet(1, "recbtn", recording);
}

function startRec() {
    if (recording) return;
    outlet(1, "rset", bufname);
    outlet(1, "rgo", 1);
    recording = 1; recStart = now(); lastLoud = now();
    outlet(1, "recbtn", 1);
    status(autoRec ? "AUTO REC... stops after 1.5 s of silence" : "REC... press REC again to chop");
}

function stopRec() {
    if (!recording) return;
    recording = 0;
    outlet(1, "rgo", 0);
    outlet(1, "recbtn", 0);
    if (autoRec) { autoRec = 0; autoArm = 0; outlet(1, "autobtn", 0); }
    status("Chopped! Play the pads on VoChop");
}

// snapshot of record~'s sync output (0..1) at the moment recording stopped
function frac(v) { outlet(0, link, "recdone", Number(v)); }

function autorec(v) {
    autoArm = Number(v) ? 1 : 0;
    if (autoArm) status(bufname ? "AUTO armed - just start speaking" : "AUTO armed (waiting for VoChop)");
    else if (!recording) status(bufname ? "Linked to VoChop (Link " + link + ")" : "No VoChop on Link " + link);
}

function thresh(v) { thr = Number(v); }

function lvl(v) {
    v = Number(v);
    var db = v > 0.000001 ? 20 * Math.log(v) / Math.LN10 : -120, t = now();
    if (db > thr) lastLoud = t;
    if (autoArm && !recording && !autoRec && db > thr && bufname) {
        autoRec = 1;
        outlet(0, link, "recreq", 1);
    } else if (recording && autoRec && t - lastLoud > 1500 && t - recStart > 400) {
        outlet(0, link, "recreq", 0);
    }
}

function anything() { }
