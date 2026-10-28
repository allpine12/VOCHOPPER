/*
  VoChop - PUSH PADS  ([js], ES5)
  While the VoChop track is selected, VoChop takes over Push's 8x8 pads (and the
  octave up/down buttons) through the Live API, lights the pads in the chop colours
  and sends presses straight to the engine. Select any other track and the pads
  go back to Push. Push's Session button also gives them back (to launch clips),
  Note takes them again. The PUSH PADS toggle switches the whole thing off.
*/
autowatch = 0;
inlets = 1;
outlets = 1;

var surface = null, matrix = null, ctlId = 0, active = 0, wanted = 1, started = 0;
var octUp = null, octDn = null, octUpId = 0, octDnId = 0;
var types = [], hues = [], hits = [], sent = [];
var selApi = null, trackId = 0, selectedId = -1, sessionMode = 0, modeWatch = [];
for (var i = 0; i < 64; i++) { types[i] = 0; hues[i] = 0; hits[i] = 0; sent[i] = -1; }

var bootTask = new Task(boot, this);
bootTask.schedule(1500);

// Push 2/3 palette: 1..25 = clip-colour hues, 122 white, 123 light grey, 124 dark grey,
// 125 blue, 126 green, 127 red
function hueColor(h) { return 1 + (Math.floor(((h % 1) + 1) % 1 * 25) % 25); }
function colorFor(p) {
    if (hits[p]) return 122;
    switch (types[p]) {
        case 1: return hueColor(hues[p]);           // word
        case 2: return 124;                         // rest of word
        case 3: return 123;                         // key in scale
        case 4: return hueColor(hues[p]);           // root key = colour of the selected word
        case 5: return 124;                         // key, nothing selected yet
        case 6: return hueColor(hues[p]);           // step with a note
        case 7: return 124;                         // empty step
        case 8: return 0;                           // step past the clip end
        case 9: return 125;                         // option on
        case 10: return 124;                        // option off
        case 11: return 126;                        // playhead
        default: return 0;
    }
}

function boot() {
    started = 1;
    findTrack();
    try {
        selApi = new LiveAPI(onSelected, "live_set view");
        selApi.property = "selected_track";
    } catch (e) { post("VoChop push: no Live API\n"); }
    watchModes();
    update();
}

// Session button -> give the pads back, Note button -> take them again
function watchModes() {
    for (var k = 0; k < 8; k++) {
        try {
            var api = new LiveAPI(null, "control_surfaces " + k);
            if (!api || Number(api.id) == 0) continue;
            var names = String(api.call("get_control_names"));
            if (names.indexOf("Button_Matrix") < 0) continue;
            post("VoChop push: surface " + k + " controls: " + names + "\n");
            var pairs = [["Session_Mode_Button", onSessionBtn], ["Note_Mode_Button", onNoteBtn]];
            for (var q = 0; q < pairs.length; q++) {
                if (names.indexOf(pairs[q][0]) < 0) continue;
                var id = parseId(api.call("get_control", pairs[q][0]));
                if (!id) continue;
                var w = new LiveAPI(pairs[q][1], "id " + id);
                w.property = "value";
                modeWatch.push(w);
            }
            return;
        } catch (e) { }
    }
}
function onSessionBtn(a) { if (a && a[0] == "value" && Number(a[1]) > 0) { sessionMode = 1; update(); } }
function onNoteBtn(a) { if (a && a[0] == "value" && Number(a[1]) > 0) { sessionMode = 0; update(); } }

function findTrack() {
    try {
        var tr = new LiveAPI(null, "this_device canonical_parent"), guard = 0;
        while (tr && String(tr.type) != "Track" && guard < 8) {
            tr = new LiveAPI(null, tr.unquotedpath + " canonical_parent");
            guard++;
        }
        if (tr && String(tr.type) == "Track") trackId = Number(tr.id);
    } catch (e) { trackId = 0; }
}

function parseId(r) {
    if (!r) return 0;
    var a = (r instanceof Array) ? r : String(r).split(" ");
    for (var k = 0; k < a.length - 1; k++) if (String(a[k]) == "id") return Number(a[k + 1]);
    return 0;
}

// "selected_track id 12"
function onSelected(a) {
    if (!a || a[0] != "selected_track") return;
    selectedId = parseId(a);
    update();
}

function update() {
    if (!started) return;
    if (selectedId < 0 && selApi) { try { selectedId = parseId(selApi.get("selected_track")); } catch (e) { } }
    var want = wanted && trackId && selectedId == trackId && !sessionMode;
    if (want && !active) grab();
    else if (!want && active) release();
}

function enable(v) {
    if (v === "bang") return;
    wanted = Number(v) ? 1 : 0;
    update();
}

function grab() {
    release();
    for (var k = 0; k < 8; k++) {
        try {
            var api = new LiveAPI(null, "control_surfaces " + k);
            if (!api || Number(api.id) == 0) continue;
            var names = String(api.call("get_control_names"));
            if (names.indexOf("Button_Matrix") < 0) continue;
            var id = parseId(api.call("get_control", "Button_Matrix"));
            if (!id) continue;
            api.call("grab_control", "id", id);
            surface = api; ctlId = id;
            matrix = new LiveAPI(onMatrix, "id " + id);
            matrix.property = "value";
            grabOct(names);
            active = 1;
            for (var q = 0; q < 64; q++) sent[q] = -1;
            outlet(0, "pushstate", 1);
            paintAll();
            return;
        } catch (e) { post("VoChop push: " + e + "\n"); }
    }
}

function grabOct(names) {
    var up = ["Octave_Up_Button", "Octave_Up"], dn = ["Octave_Down_Button", "Octave_Down"], k;
    for (k = 0; k < up.length; k++) if (names.indexOf(up[k]) >= 0) {
        octUpId = parseId(surface.call("get_control", up[k]));
        if (octUpId) { surface.call("grab_control", "id", octUpId); octUp = new LiveAPI(onOctUp, "id " + octUpId); octUp.property = "value"; break; }
    }
    for (k = 0; k < dn.length; k++) if (names.indexOf(dn[k]) >= 0) {
        octDnId = parseId(surface.call("get_control", dn[k]));
        if (octDnId) { surface.call("grab_control", "id", octDnId); octDn = new LiveAPI(onOctDn, "id " + octDnId); octDn.property = "value"; break; }
    }
    lightOct();
}

function lightOct() {
    try { if (octUp) octUp.call("send_value", 127); if (octDn) octDn.call("send_value", 127); } catch (e) { }
}

function onOctUp(a) { if (active && a && a[0] == "value" && Number(a[1]) > 0) outlet(0, "octup", 1); }
function onOctDn(a) { if (active && a && a[0] == "value" && Number(a[1]) > 0) outlet(0, "octdown", 1); }

function release() {
    if (surface) {
        var ids = [ctlId, octUpId, octDnId];
        for (var k = 0; k < ids.length; k++) if (ids[k]) { try { surface.call("release_control", "id", ids[k]); } catch (e) { } }
    }
    if (matrix) { try { matrix.property = ""; } catch (e2) { } }
    if (octUp) { try { octUp.property = ""; } catch (e3) { } }
    if (octDn) { try { octDn.property = ""; } catch (e4) { } }
    surface = null; matrix = null; ctlId = 0; octUp = null; octDn = null; octUpId = 0; octDnId = 0;
    if (active) outlet(0, "pushstate", 0);
    active = 0;
}

// matrix value callback: "value <velocity> <x> <y> <is_momentary>"  (y = 0 is the top row)
function onMatrix(a) {
    if (!active || !a || a[0] != "value" || a.length < 4) return;
    var vel = Number(a[1]), x = Number(a[2]), y = Number(a[3]);
    if (isNaN(x) || isNaN(y)) return;
    outlet(0, "padclick", (7 - y) * 8 + x, vel);
}

function send(p) {
    if (!active || !matrix) return;
    var c = colorFor(p);
    if (sent[p] == c) return;
    sent[p] = c;
    try { matrix.call("send_value", p % 8, 7 - Math.floor(p / 8), c); } catch (e) { }
}
function paintAll() { for (var p = 0; p < 64; p++) send(p); }

// ---- data from the engine (same stream the on-screen grid gets)
function pad() {
    var a = arrayfromargs(arguments), p = Number(a[0]);
    if (p < 0 || p > 63) return;
    types[p] = Number(a[1]); hues[p] = Number(a[2]);
}
function refresh() { paintAll(); }
function hit(p, v) { if (p < 0 || p > 63) return; hits[p] = v ? 1 : 0; send(p); }

function notifydeleted() { release(); }
function anything() { }   // ignore other UI messages (status, wave, ...)
