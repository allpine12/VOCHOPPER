/*
  VoChop - pad grid + waveform display  ([jsui], mgraphics, ES5)
  jsarguments: "main" (grid + waveform, device view) or "big" (large grid window)
*/
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;
inlets = 1;
outlets = 1;

var BIG = (jsarguments.length > 1 && String(jsarguments[1]) == "big");

var pads = [];
for (var i = 0; i < 64; i++) pads.push({ t: 0, h: 0, l: "", e: [], hit: 0 });
var waveData = [], regionData = [], markData = [];
var statusTxt = "VoChop ready", infoTxt = "";
var selR = null, playR = null;
var modeNo = 0, baseNote = 36, recOn = 0, aiState = 0;
var pressed = -1;
var MODE_NAMES = ["WORDS + PARTS", "SYLLABLES", "WORD LIST", "KEYS"];

// ---------------------------------------------------------------- colours
var BG = [0.075, 0.08, 0.095], PANEL = [0.11, 0.118, 0.137], EMPTY = [0.155, 0.165, 0.19];
var ACCENT = [1.0, 0.42, 0.24], TXT = [0.86, 0.88, 0.92], DIM = [0.5, 0.53, 0.58];

function hsl(h, s, l) {
    function f(n) {
        var k = (n + h * 12) % 12, a = s * Math.min(l, 1 - l);
        return l - a * Math.max(-1, Math.min(k - 3, Math.min(9 - k, 1)));
    }
    return [f(0), f(8), f(4)];
}
function mix(c, d, t) { return [c[0] + (d[0] - c[0]) * t, c[1] + (d[1] - c[1]) * t, c[2] + (d[2] - c[2]) * t]; }
function col(c, a) { mgraphics.set_source_rgba(c[0], c[1], c[2], a === undefined ? 1 : a); }

// ---------------------------------------------------------------- messages
function begin() { }
function pad() {
    var a = arrayfromargs(arguments), k = a[0];
    if (k < 0 || k > 63) return;
    pads[k] = { t: a[1], h: a[2], l: String(a[3]), e: a.slice(4), hit: pads[k].hit };
}
function wave() { waveData = arrayfromargs(arguments); mgraphics.redraw(); }
function regions() { regionData = arrayfromargs(arguments); }
function marks() { markData = arrayfromargs(arguments); }
function sel(a, b) { selR = (a < 0) ? null : [a, b]; }
function play(a, b) { playR = [a, b]; mgraphics.redraw(); }
function hit(k, v) {
    if (k < 0 || k > 63) return;
    pads[k].hit = v;
    if (!v) { var any = 0; for (var q = 0; q < 64; q++) if (pads[q].hit) any = 1; if (!any) playR = null; }
    mgraphics.redraw();
}
function status() { statusTxt = arrayfromargs(arguments).join(" "); mgraphics.redraw(); }
function info() { infoTxt = arrayfromargs(arguments).join(" "); mgraphics.redraw(); }
function mode(m) { modeNo = m; mgraphics.redraw(); }
function base(b) { baseNote = b; mgraphics.redraw(); }
function rec(v) { recOn = v; mgraphics.redraw(); }
function ai(v) { aiState = v; mgraphics.redraw(); }
function refresh() { mgraphics.redraw(); }
function bang() { mgraphics.redraw(); }

// ---------------------------------------------------------------- geometry
function geom() {
    var w = box.rect[2] - box.rect[0], h = box.rect[3] - box.rect[1], g = { w: w, h: h };
    if (BIG) {
        g.side = Math.min(w - 24, h - 64);
        g.gx = (w - g.side) / 2; g.gy = 34;
    } else {
        g.side = h - 8; g.gx = 4; g.gy = 4;
    }
    g.cell = g.side / 8;
    g.wx = g.gx + g.side + 10; g.wy = 4; g.ww = w - g.wx - 4; g.wh = h - 8;
    return g;
}

function padAt(x, y) {
    var g = geom();
    var c = Math.floor((x - g.gx) / g.cell), r = Math.floor((y - g.gy) / g.cell);
    if (c < 0 || c > 7 || r < 0 || r > 7) return -1;
    return (7 - r) * 8 + c;
}

// ---------------------------------------------------------------- drawing
function txt(s, x, y, size, c, a, bold) {
    mgraphics.select_font_face(bold ? "Arial Bold" : "Arial");
    mgraphics.set_font_size(size);
    col(c, a);
    mgraphics.move_to(x, y);
    mgraphics.show_text(String(s));
}
function tw(s, size, bold) {
    mgraphics.select_font_face(bold ? "Arial Bold" : "Arial");
    mgraphics.set_font_size(size);
    return mgraphics.text_measure(String(s))[0];
}
function fit(s, size, maxw, bold) {
    s = String(s);
    if (tw(s, size, bold) <= maxw) return s;
    while (s.length > 1 && tw(s + ".", size, bold) > maxw) s = s.substring(0, s.length - 1);
    return s + ".";
}

function padColor(p) {
    var c;
    switch (p.t) {
        case 1: c = hsl(p.h, 0.78, 0.56); break;            // word
        case 2: c = hsl(p.h, 0.50, 0.31); break;            // part
        case 3: c = [0.30, 0.32, 0.36]; break;              // key (white)
        case 4: c = ACCENT; break;                          // key C
        case 5: c = [0.19, 0.2, 0.235]; break;              // key (black)
        default: c = EMPTY;
    }
    if (p.hit) c = mix(c, [1, 1, 1], 0.62);
    return c;
}

function paint() {
    var g = geom(), k, x, y;
    col(BG); mgraphics.rectangle(0, 0, g.w, g.h); mgraphics.fill();

    // ---- grid
    var cell = g.cell, s = cell - 2, rr = Math.max(2, cell * 0.14);
    for (var r = 0; r < 8; r++) {
        for (var c = 0; c < 8; c++) {
            var pi = (7 - r) * 8 + c, p = pads[pi];
            x = g.gx + c * cell + 1; y = g.gy + r * cell + 1;
            var pc = padColor(p);
            col(pc);
            mgraphics.rectangle_rounded(x, y, s, s, rr, rr); mgraphics.fill();
            if ((p.t == 1 || p.t == 2) && p.e.length) {
                var n = p.e.length, bw = (s - 4) / n, maxh = s * (BIG ? 0.38 : 0.5);
                col(p.t == 1 ? [0, 0, 0] : [1, 1, 1], p.t == 1 ? 0.32 : 0.30);
                for (var q = 0; q < n; q++) {
                    var bh = Math.max(1, p.e[q] * maxh);
                    mgraphics.rectangle(x + 2 + q * bw, y + s - 2 - bh, Math.max(1, bw - 0.6), bh);
                }
                mgraphics.fill();
            }
            if (BIG || cell >= 30) {
                if (p.t != 0) {
                    var fs = BIG ? Math.max(9, Math.min(15, cell * 0.2)) : 8;
                    var lab = fit(p.l, fs, s - 6, p.t == 1);
                    txt(lab, x + 4, y + fs + 3, fs, (p.t == 1 || p.t == 4) ? [0.06, 0.06, 0.08] : TXT, 0.95, p.t == 1);
                }
            }
            if (pi == pressed) {
                col([1, 1, 1], 0.9); mgraphics.set_line_width(1.5);
                mgraphics.rectangle_rounded(x + 0.5, y + 0.5, s - 1, s - 1, rr, rr); mgraphics.stroke();
            }
        }
    }
    // bottom-left marker = base note
    if (!BIG) {
        col(ACCENT, 0.9);
        mgraphics.rectangle(g.gx + 1, g.gy + g.side - 2, cell - 2, 1.5); mgraphics.fill();
    }

    if (BIG) { paintBigText(g); return; }

    // ---- waveform panel
    col(PANEL); mgraphics.rectangle_rounded(g.wx, g.wy, g.ww, g.wh, 6, 6); mgraphics.fill();
    var hx = g.wx + 8, top = g.wy + 22, bot = g.wy + g.wh - 20, wh = bot - top, mid = top + wh / 2, ww = g.ww - 16;

    // header
    if (recOn) {
        col([1, 0.22, 0.2]); mgraphics.ellipse(hx, g.wy + 7, 8, 8); mgraphics.fill();
        txt(fit(statusTxt, 10, ww - 150, true), hx + 13, g.wy + 15, 10, [1, 0.45, 0.42], 1, true);
    } else {
        txt(fit(statusTxt, 10, ww - 150, true), hx, g.wy + 15, 10, TXT, 1, true);
    }
    var tag = MODE_NAMES[modeNo] || "";
    var aiTag = aiState == 2 ? "AI" : (aiState == 1 ? "AI..." : "");
    var tagw = tw(tag, 8, true) + 10;
    col([1, 1, 1], 0.07); mgraphics.rectangle_rounded(g.wx + g.ww - tagw - 8, g.wy + 5, tagw, 13, 4, 4); mgraphics.fill();
    txt(tag, g.wx + g.ww - tagw - 3, g.wy + 14.5, 8, DIM, 1, true);
    if (aiTag) {
        var aw = tw(aiTag, 8, true) + 10;
        col(ACCENT, aiState == 2 ? 0.9 : 0.4); mgraphics.rectangle_rounded(g.wx + g.ww - tagw - aw - 12, g.wy + 5, aw, 13, 4, 4); mgraphics.fill();
        txt(aiTag, g.wx + g.ww - tagw - aw - 7, g.wy + 14.5, 8, [0.08, 0.08, 0.1], 1, true);
    }

    // regions (words)
    for (k = 0; k + 3 < regionData.length; k += 4) {
        var a = regionData[k], b = regionData[k + 1], hc = hsl(regionData[k + 2], 0.75, 0.55);
        col(hc, 0.13); mgraphics.rectangle(hx + a * ww, top, (b - a) * ww, wh); mgraphics.fill();
        col(hc, 0.95); mgraphics.rectangle(hx + a * ww, top, Math.max(1, (b - a) * ww - 1), 2.5); mgraphics.fill();
    }
    // selection (keys source) & now playing
    if (selR) {
        col(ACCENT, 0.9); mgraphics.set_line_width(1.2);
        mgraphics.rectangle(hx + selR[0] * ww, top + 0.5, (selR[1] - selR[0]) * ww, wh - 1); mgraphics.stroke();
    }
    if (playR) {
        col([1, 1, 1], 0.1); mgraphics.rectangle(hx + playR[0] * ww, top, (playR[1] - playR[0]) * ww, wh); mgraphics.fill();
    }
    // waveform
    if (waveData.length) {
        var n2 = waveData.length, bw2 = ww / n2;
        col([0.82, 0.85, 0.9], 0.78);
        for (k = 0; k < n2; k++) {
            var v = Math.max(0.004, waveData[k]) * (wh / 2 - 3);
            mgraphics.rectangle(hx + k * bw2, mid - v, Math.max(0.8, bw2 - 0.25), v * 2);
        }
        mgraphics.fill();
    } else {
        col([1, 1, 1], 0.12); mgraphics.rectangle(hx, mid, ww, 1); mgraphics.fill();
        txt("press REC and speak  -  or drag an audio file onto DROP", hx + ww / 2 - 125, mid - 8, 9.5, DIM, 1, false);
    }
    // part marks
    col([1, 1, 1], 0.45);
    for (k = 0; k < markData.length; k++) {
        var mx = hx + markData[k] * ww;
        for (var dy = top + 4; dy < bot; dy += 5) mgraphics.rectangle(mx, dy, 1, 2.5);
    }
    mgraphics.fill();
    // word labels
    for (k = 0; k + 3 < regionData.length; k += 4) {
        var ra = regionData[k], rb = regionData[k + 1], rw = (rb - ra) * ww;
        var wl = String(regionData[k + 3]);
        if (rw > 14 && wl) txt(fit(wl, 8.5, rw - 3, true), hx + ra * ww + 2, top + 12, 8.5, hsl(regionData[k + 2], 0.8, 0.72), 1, true);
    }
    // footer
    txt(fit(infoTxt || "click a pad to play  |  click the waveform to pick a word for KEYS", 9, ww - 70, false), hx, g.wy + g.wh - 6, 9, DIM, 1, false);
    txt("base " + noteName(baseNote), g.wx + g.ww - 52, g.wy + g.wh - 6, 9, DIM, 1, false);
}

function paintBigText(g) {
    txt(fit(statusTxt, 13, g.w - 24, true), 12, 22, 13, recOn ? [1, 0.45, 0.42] : TXT, 1, true);
    txt(fit(infoTxt || "click pads to play - top row/top pad = whole word, pads below = its parts", 11, g.w - 24, false),
        12, g.h - 12, 11, DIM, 1, false);
}

function noteName(n) {
    var N = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
    n = Math.round(n);
    return N[((n % 12) + 12) % 12] + (Math.floor(n / 12) - 2);
}

// ---------------------------------------------------------------- mouse
function velFromY(y, p) {
    var g = geom(), r = Math.floor((y - g.gy) / g.cell);
    var yin = (y - g.gy - r * g.cell) / g.cell;          // 0 top .. 1 bottom
    return Math.max(20, Math.min(127, Math.round(127 - yin * 80)));
}

function onclick(x, y, but, cmd, shift, caps, opt, ctrl) {
    var p = padAt(x, y);
    if (p >= 0) {
        pressed = p;
        outlet(0, "padclick", p, shift ? 127 : velFromY(y, p));
        mgraphics.redraw();
        return;
    }
    if (!BIG) {
        var g = geom();
        if (x >= g.wx + 8 && x <= g.wx + g.ww - 8 && y > g.wy + 20) {
            outlet(0, "waveclick", Math.max(0, Math.min(1, (x - g.wx - 8) / (g.ww - 16))));
        }
    }
}

function ondrag(x, y, but, cmd, shift, caps, opt, ctrl) {
    if (pressed < 0) return;
    if (!but) {
        outlet(0, "padclick", pressed, 0);
        pressed = -1;
        mgraphics.redraw();
        return;
    }
    var p = padAt(x, y);
    if (p >= 0 && p != pressed) {              // slide across pads to play them
        outlet(0, "padclick", pressed, 0);
        pressed = p;
        outlet(0, "padclick", p, shift ? 127 : velFromY(y, p));
        mgraphics.redraw();
    }
}

function onresize() { mgraphics.redraw(); }
