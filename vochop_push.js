/*
  VoChop - PUSH PADS (beta)  ([js], ES5)
  Takes over Push's 8x8 pad matrix through the Live API so the pads light up
  in VoChop's word colours. Pad presses are sent straight to the engine.
  Turn it off to give the pads back to Push.
*/
autowatch = 0;
inlets = 1;
outlets = 1;

var surface = null, matrix = null, ctlId = 0, active = 0, wanted = 0;
var types = [], hues = [], hits = [];
for (var i = 0; i < 64; i++) { types[i] = 0; hues[i] = 0; hits[i] = 0; }

var bootTask = new Task(function () { if (wanted && !active) grab(); }, this);

// Push palette guesses: 1..25 = clip-colour hues, 122 white, 123/124 greys, 125 blue
function colorFor(p) {
    if (hits[p]) return 122;
    switch (types[p]) {
        case 1: return 1 + (Math.floor(hues[p] * 25) % 25);
        case 2: return 124;
        case 3: return 123;
        case 4: return 125;
        case 5: return 0;
        default: return 0;
    }
}

function enable(v) {
    if (v === "bang") return;
    wanted = Number(v) ? 1 : 0;
    if (wanted) { bootTask.cancel(); bootTask.schedule(300); }
    else release();
}

function parseId(r) {
    if (!r) return 0;
    var a = (r instanceof Array) ? r : String(r).split(" ");
    for (var k = 0; k < a.length - 1; k++) if (String(a[k]) == "id") return Number(a[k + 1]);
    return 0;
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
            active = 1;
            outlet(0, "pushstate", 1);
            paintAll();
            return;
        } catch (e) { post("VoChop push: " + e + "\n"); }
    }
    outlet(0, "pushstate", 0);
}

function release() {
    if (surface && ctlId) {
        try { surface.call("release_control", "id", ctlId); } catch (e) { }
    }
    if (matrix) { try { matrix.property = ""; } catch (e2) { } }
    surface = null; matrix = null; ctlId = 0;
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
    try { matrix.call("send_value", p % 8, 7 - Math.floor(p / 8), colorFor(p)); } catch (e) { }
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
