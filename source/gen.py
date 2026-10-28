#!/usr/bin/env python3
"""
Generates the VoChop Max for Live devices (.amxd) from code.
  python3 gen.py           -> ../VoChop.amxd, ../VoChop Input.amxd (+ .maxpat copies here)
"""
import json, struct, os

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.dirname(HERE)

APPVERSION = {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1}


class Patch:
    def __init__(self):
        self.boxes, self.lines, self.n = [], [], 0

    def _id(self):
        self.n += 1
        return "obj-%d" % self.n

    def add(self, box):
        box["id"] = self._id()
        self.boxes.append({"box": box})
        return box["id"]

    def obj(self, text, x, y, ins=1, outs=1, otype=None, w=None, **kw):
        if otype is None:
            otype = [""] * outs
        b = {"maxclass": "newobj", "text": text, "numinlets": ins, "numoutlets": outs,
             "outlettype": otype, "patching_rect": [x, y, w or max(40, 7 * len(text) + 14), 22.0]}
        b.update(kw)
        return self.add(b)

    def msg(self, text, x, y, **kw):
        b = {"maxclass": "message", "text": text, "numinlets": 2, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [x, y, max(40, 7 * len(text) + 14), 22.0]}
        b.update(kw)
        return self.add(b)

    def ui(self, maxclass, x, y, w, h, ins, outs, otype, pres=None, **kw):
        b = {"maxclass": maxclass, "numinlets": ins, "numoutlets": outs, "outlettype": otype,
             "patching_rect": [x, y, w, h]}
        if pres:
            b["presentation"] = 1
            b["presentation_rect"] = list(pres)
        b.update(kw)
        return self.add(b)

    def con(self, a, ao, b, bi):
        self.lines.append({"patchline": {"source": [a, ao], "destination": [b, bi]}})

    def patcher(self, rect, devicewidth=None, presentation=True, extra=None):
        p = {
            "fileversion": 1, "appversion": APPVERSION, "classnamespace": "box",
            "rect": rect, "bglocked": 0, "openinpresentation": 1 if presentation else 0,
            "default_fontsize": 10.0, "default_fontface": 0, "default_fontname": "Arial Bold",
            "gridonopen": 1, "gridsize": [8.0, 8.0], "gridsnaponopen": 1, "objectsnaponopen": 1,
            "statusbarvisible": 2, "toolbarvisible": 1, "lefttoolbarpinned": 0, "toptoolbarpinned": 0,
            "righttoolbarpinned": 0, "bottomtoolbarpinned": 0, "toolbars_unpinned_last_save": 0,
            "tallnewobj": 0, "boxanimatetime": 200, "enablehscroll": 1, "enablevscroll": 1,
            "devicewidth": float(devicewidth or 0), "description": "", "digest": "", "tags": "",
            "style": "", "subpatcher_template": "", "assistshowspatchername": 0,
            "boxes": self.boxes, "lines": self.lines,
        }
        if extra:
            p.update(extra)
        return p


def param(longname, ptype, mn=0.0, mx=1.0, init=0.0, unit=1, enum=None, expo=None, invisible=0, short=None):
    v = {"parameter_longname": longname, "parameter_shortname": short or longname,
         "parameter_type": ptype, "parameter_mmin": float(mn), "parameter_mmax": float(mx),
         "parameter_initial": [init], "parameter_initial_enable": 1, "parameter_unitstyle": unit,
         "parameter_invisible": invisible}
    if enum is not None:
        v["parameter_enum"] = enum
        v["parameter_mmax"] = float(len(enum) - 1)
    if expo:
        v["parameter_exponent"] = float(expo)
    return {"valueof": v}


def dial(P, name, x, y, pres, mn, mx, init, unit, ptype=0, expo=None, enum=None, short=None):
    return P.ui("live.dial", x, y, 44, 48, 1, 2, ["", "float"], pres, parameter_enable=1,
                varname=name, saved_attribute_attributes=param(name, ptype, mn, mx, init, unit, enum, expo, short=short))


def menu(P, name, x, y, pres, enum, init=0):
    return P.ui("live.menu", x, y, 100, 15, 1, 3, ["", "", "float"], pres, parameter_enable=1,
                varname=name, saved_attribute_attributes=param(name, 2, 0, len(enum) - 1, init, 9, enum))


def toggle(P, name, x, y, pres, text, init=0, param_on=True, oncolor=None, short=None):
    kw = dict(mode=1, text=text, texton=text, varname=name)
    if oncolor:
        kw["activebgoncolor"] = oncolor
    if param_on:
        kw["parameter_enable"] = 1
        kw["saved_attribute_attributes"] = param(name, 2, 0, 1, init, 9, ["off", "on"], short=short)
    else:
        kw["parameter_enable"] = 0
    return P.ui("live.text", x, y, 44, 15, 1, 2, ["", ""], pres, **kw)


def button(P, name, x, y, pres, text):
    return P.ui("live.text", x, y, 44, 15, 1, 2, ["", ""], pres, mode=0, text=text, texton=text,
                varname=name, parameter_enable=0)


def numbox(P, name, x, y, pres, mn, mx, init, unit=0):
    return P.ui("live.numbox", x, y, 44, 15, 1, 2, ["", "float"], pres, parameter_enable=1, varname=name,
                saved_attribute_attributes=param(name, 1, mn, mx, init, unit))


def label(P, text, x, y, pres, size=9.5, bold=0):
    return P.ui("live.comment", x, y, 120, 18, 1, 0, [], pres, text=text, fontsize=float(size), fontface=bold)


def write_amxd(patcher, path, devtype):
    data = json.dumps({"patcher": patcher}, indent=1).encode("utf-8") + b"\n\x00"
    header = (b"ampf" + struct.pack("<I", 4) + devtype + b"meta" + struct.pack("<I", 4) +
              struct.pack("<I", 0) + b"ptch" + struct.pack("<I", len(data)))
    with open(path, "wb") as f:
        f.write(header + data)
    with open(os.path.join(HERE, os.path.basename(path).replace(".amxd", ".maxpat")), "w") as f:
        json.dump({"patcher": patcher}, f, indent=1)


# ============================================================================ INSTRUMENT
def build_instrument():
    P = Patch()
    # ---------------------------------------------------------------- core
    thisdev = P.obj("live.thisdevice", 20, 20, 1, 3, ["bang", "int", "int"])
    tbbb = P.obj("t b b b", 20, 50, 1, 3, ["bang", "bang", "bang"])
    m_init = P.msg("init", 200, 80)
    m_start = P.msg("start", 20, 80)
    P.con(thisdev, 0, tbbb, 0)
    P.con(tbbb, 2, m_init, 0)
    P.con(tbbb, 0, m_start, 0)

    js = P.obj("js vochop.js ---vc", 20, 400, 1, 3, ["", "", ""], w=180)
    for m in (m_init, m_start):
        P.con(m, 0, js, 0)

    # MIDI
    notein = P.obj("notein", 300, 20, 1, 3, ["int", "int", "int"])
    pk = P.obj("pack 0 0", 300, 50, 2, 1, [""])
    pn = P.obj("prepend note", 300, 80, 1, 1, [""])
    P.con(notein, 0, pk, 0); P.con(notein, 1, pk, 1); P.con(pk, 0, pn, 0); P.con(pn, 0, js, 0)
    bendin = P.obj("bendin", 420, 20, 1, 2, ["int", "int"])
    pb = P.obj("prepend bend", 420, 50, 1, 1, [""])
    P.con(bendin, 0, pb, 0); P.con(pb, 0, js, 0)

    # inter-device bus
    rbus = P.obj("r vochop_bus_inst", 540, 20, 0, 1, [""])
    pbus = P.obj("prepend busin", 540, 50, 1, 1, [""])
    P.con(rbus, 0, pbus, 0); P.con(pbus, 0, js, 0)
    rclick = P.obj("r ---uiclick", 700, 20, 0, 1, [""])
    P.con(rclick, 0, js, 0)

    # UI
    jsui = P.ui("jsui", 20, 470, 520, 165, 1, 1, [""], (170, 2, 520, 165), filename="vochop_ui.js",
                jsarguments=["main"], border=0, parameter_enable=0)
    P.con(js, 1, jsui, 0)
    P.con(jsui, 0, js, 0)
    sbig = P.obj("s ---bigui", 560, 470, 1, 0, [])
    P.con(js, 1, sbig, 0)
    pushjs = P.obj("js vochop_push.js", 680, 470, 1, 1, [""], w=130)
    P.con(js, 1, pushjs, 0)
    P.con(pushjs, 0, js, 0)

    # AI words (Node for Max)
    node = P.obj("node.script vochop_asr.js @autostart 1 @watch 0", 860, 470, 1, 2, ["", ""], w=290)
    P.con(node, 0, js, 0)

    # js outlet 2 router
    route = P.obj("route buf bus fx setrec setbase pattr node", 20, 700, 1, 8, [""] * 8, w=300)
    P.con(js, 2, route, 0)
    buf = P.obj("buffer~ ---vc 60000 1", 20, 760, 1, 2, ["float", "bang"], w=150)
    P.con(route, 0, buf, 0)
    tb = P.obj("t b", 20, 790, 1, 1, ["bang"])
    m_loaded = P.msg("loaded", 20, 820)
    P.con(buf, 1, tb, 0); P.con(tb, 0, m_loaded, 0); P.con(m_loaded, 0, js, 0)
    sbus = P.obj("s vochop_bus_in", 180, 760, 1, 0, [])
    P.con(route, 1, sbus, 0)
    P.con(route, 6, node, 0)

    pattr = P.obj("pattr vcstate @parameter_enable 1", 520, 760, 2, 3, ["", "", ""], w=210,
                  parameter_enable=1,
                  saved_attribute_attributes={"valueof": {"parameter_longname": "vcstate",
                                                          "parameter_shortname": "vcstate",
                                                          "parameter_type": 3, "parameter_invisible": 1,
                                                          "parameter_initial_enable": 0}},
                  varname="vcstate")
    P.con(route, 5, pattr, 0)
    pst = P.obj("prepend state", 520, 790, 1, 1, [""])
    P.con(pattr, 0, pst, 0); P.con(pst, 0, js, 0)

    # ---------------------------------------------------------------- left panel
    label(P, "VOCHOP", 20, 900, (8, 2, 110, 22), size=15, bold=1)
    rec = toggle(P, "Rec", 20, 940, (8, 27, 74, 26), "REC", oncolor=[1.0, 0.24, 0.2, 1.0])
    prec = P.obj("prepend rec", 20, 970, 1, 1, [""])
    P.con(rec, 0, prec, 0); P.con(prec, 0, js, 0)
    setrec = P.obj("prepend set", 120, 970, 1, 1, [""])
    P.con(route, 3, setrec, 0); P.con(setrec, 0, rec, 0)

    drop = P.ui("live.drop", 220, 940, 76, 26, 1, 1, [""], (88, 27, 76, 26), parameter_enable=0)
    pdrop = P.obj("prepend dropfile", 220, 970, 1, 1, [""])
    P.con(drop, 0, pdrop, 0); P.con(pdrop, 0, js, 0)

    params = []   # (box, jsname) -> "p jsname value"
    params.append((menu(P, "Mode", 320, 940, (8, 58, 156, 16), ["Words + Parts", "Syllables", "Word List", "Keys"]), "mode"))
    params.append((menu(P, "Trigger", 440, 940, (8, 78, 156, 16), ["One-Shot", "Gate", "Loop"]), "trig"))

    learn = button(P, "Learn", 20, 1010, (8, 98, 44, 16), "LEARN")
    plearn = P.obj("prepend learn", 20, 1040, 1, 1, [""])
    P.con(learn, 0, plearn, 0); P.con(plearn, 0, js, 0)
    base = numbox(P, "Base", 100, 1010, (56, 98, 50, 16), 0, 64, 36, 8)
    params.append((base, "base"))
    setbase = P.obj("prepend set", 100, 1040, 1, 1, [""])
    P.con(route, 4, setbase, 0); P.con(setbase, 0, base, 0)
    tprev = button(P, "TakePrev", 180, 1010, (110, 98, 26, 16), "<")
    tnext = button(P, "TakeNext", 230, 1010, (138, 98, 26, 16), ">")
    ptp = P.obj("prepend takeprev", 180, 1040, 1, 1, [""])
    ptn = P.obj("prepend takenext", 300, 1040, 1, 1, [""])
    P.con(tprev, 0, ptp, 0); P.con(ptp, 0, js, 0); P.con(tnext, 0, ptn, 0); P.con(ptn, 0, js, 0)

    bigv = button(P, "BigView", 20, 1080, (8, 118, 76, 16), "BIG VIEW")
    mk = button(P, "MakeClip", 100, 1080, (88, 118, 76, 16), "MAKE CLIP")
    pmk = P.obj("prepend makeclip", 100, 1110, 1, 1, [""])
    P.con(mk, 0, pmk, 0); P.con(pmk, 0, js, 0)

    ai = toggle(P, "AI Words", 20, 1150, (8, 138, 76, 16), "AI WORDS", init=0, oncolor=[1.0, 0.42, 0.24, 1.0])
    params.append((ai, "ai"))
    pushb = toggle(P, "Push Pads", 100, 1150, (88, 138, 76, 16), "PUSH PADS", init=0)
    pen = P.obj("prepend enable", 100, 1180, 1, 1, [""])
    P.con(pushb, 0, pen, 0); P.con(pen, 0, pushjs, 0)
    label(P, "Link", 200, 1150, (112, 3, 26, 18), size=8.5)
    link = numbox(P, "Link", 200, 1180, (136, 4, 28, 15), 1, 4, 1, 0)
    params.append((link, "link"))

    # big view subpatcher
    SP = Patch()
    sin = SP.obj("inlet", 20, 10, 0, 1, [""])
    rbig = SP.obj("r ---bigui", 80, 10, 0, 1, [""])
    bjsui = SP.ui("jsui", 0, 40, 560, 600, 1, 1, [""], (0, 0, 560, 600), filename="vochop_ui.js",
                  jsarguments=["big"], border=0, parameter_enable=0)
    sclick = SP.obj("s ---uiclick", 20, 660, 1, 0, [])
    SP.con(rbig, 0, bjsui, 0); SP.con(bjsui, 0, sclick, 0)
    sub = SP.patcher([120.0, 120.0, 560.0, 600.0], presentation=True,
                     extra={"toolbarvisible": 0, "statusbarvisible": 0, "title": "VoChop - Big View"})
    bigp = P.obj("p bigview", 20, 1140, 1, 0, [], w=80, patcher=sub,
                 saved_object_attributes={"description": "", "digest": "", "globalpatchername": "", "tags": "", "style": ""})
    tbb = P.obj("t b", 20, 1110, 1, 1, ["bang"])
    mopen = P.msg("open", 60, 1110)
    pctl = P.obj("pcontrol", 60, 1140, 1, 1, [""])
    P.con(bigv, 0, tbb, 0); P.con(tbb, 0, mopen, 0); P.con(mopen, 0, pctl, 0); P.con(pctl, 0, bigp, 0)

    # ---------------------------------------------------------------- dials
    X0, DX, Y = 698, 46, (2, 57, 112)
    def pos(c, r):
        return (X0 + c * DX, Y[r], 44, 52)
    D = []
    D.append(("Pitch", "pitch", 0, 0, -24, 24, 0, 7, 1, None, None))
    D.append(("Attack", "attack", 1, 0, 0, 500, 2, 2, 0, 3, None))
    D.append(("Release", "release", 2, 0, 5, 4000, 120, 2, 0, 3, None))
    D.append(("Spread", "spread", 3, 0, 0, 100, 30, 5, 0, None, None))
    D.append(("Poly", "poly", 4, 0, 1, 8, 8, 0, 1, None, None))
    D.append(("Velocity", "vel", 5, 0, 0, 100, 70, 5, 0, None, None))
    D.append(("Stutter", "stutter", 6, 0, 0, 6, 0, 9, 2, None, ["Off", "1/4", "1/8", "1/16", "1/32", "1/8T", "1/16T"]))
    D.append(("Cutoff", "cutoff", 0, 1, 20, 20000, 20000, 3, 0, 3, None))
    D.append(("Reso", "reso", 1, 1, 0, 100, 10, 5, 0, None, None))
    D.append(("Crush", "crush", 2, 1, 0, 100, 0, 5, 0, None, None))
    D.append(("Drive", "drive", 3, 1, 0, 100, 0, 5, 0, None, None))
    D.append(("Delay", "delay", 4, 1, 0, 100, 0, 5, 0, None, None))
    D.append(("Time", "dtime", 5, 1, 0, 6, 2, 9, 2, None, ["1/16", "1/8T", "1/8", "1/8D", "1/4", "1/4D", "1/2"]))
    D.append(("Feedback", "fdbk", 6, 1, 0, 95, 40, 5, 0, None, None))
    D.append(("Reverb", "reverb", 0, 2, 0, 100, 0, 5, 0, None, None))
    D.append(("Size", "size", 1, 2, 0, 100, 60, 5, 0, None, None))
    D.append(("Words", "wsens", 2, 2, 0, 100, 50, 5, 0, None, None))
    D.append(("Syllables", "ssens", 3, 2, 0, 100, 50, 5, 0, None, None))
    D.append(("Filter", "ftype", 4, 2, 0, 3, 0, 9, 2, None, ["Off", "LP", "HP", "BP"]))
    for i, (name, jn, c, r, mn, mx, init, unit, ptype, expo, enum) in enumerate(D):
        b = dial(P, name, 800 + (i % 7) * 60, 20 + (i // 7) * 70, pos(c, r), mn, mx, init, unit, ptype, expo, enum,
                 short={"Velocity": "Vel", "Syllables": "Syll", "Feedback": "Fdbk"}.get(name))
        params.append((b, jn))
    tg = [("Reverse", "reverse", 0, 0, 0), ("Snap", "snap", 1, 0, 0), ("Tune", "tune", 0, 1, 1), ("Choke", "choke", 1, 1, 0)]
    for name, jn, c, r, init in tg:
        b = toggle(P, name, 800 + c * 60, 240 + r * 30, (X0 + 5 * DX + c * 46, 116 + r * 19, 44, 16), name.upper(), init=init)
        params.append((b, jn))

    for b, jn in params:
        pp = P.obj("prepend p " + jn, 0, 0, 1, 1, [""])
        # tidy placement of prepends next to their control
        for bx in P.boxes:
            if bx["box"]["id"] == b:
                r = bx["box"]["patching_rect"]
                [bb for bb in P.boxes if bb["box"]["id"] == pp][0]["box"]["patching_rect"] = [r[0], r[1] + r[3] + 6, 110, 22]
        P.con(b, 0, pp, 0); P.con(pp, 0, js, 0)
    # bang dials / menus / numboxes at start so the engine gets restored values
    for b, jn in params:
        if jn not in ("reverse", "snap", "tune", "choke", "ai"):
            P.con(tbbb, 1, b, 0)

    # ---------------------------------------------------------------- voices
    vr = P.obj("route 0 1 2 3 4 5 6 7", 20, 1300, 1, 9, [""] * 9, w=200)
    P.con(js, 0, vr, 0)
    mixL = P.obj("*~ 1.", 20, 1900, 2, 1, ["signal"])
    mixR = P.obj("*~ 1.", 120, 1900, 2, 1, ["signal"])
    for v in range(8):
        x = 20 + v * 260
        y = 1340
        vrt = P.obj("route ph ln of tz pn ev", x, y, 1, 7, [""] * 7, w=200)
        P.con(vr, v, vrt, 0)
        ph = P.obj("line~", x, y + 30, 2, 2, ["signal", "bang"])
        ln = P.obj("*~ 0.", x, y + 60, 2, 1, ["signal"])
        of = P.obj("+~ 0.", x, y + 90, 2, 1, ["signal"])
        pl = P.obj("play~ ---vc 1", x, y + 120, 1, 2, ["signal", "bang"], w=90)
        tzu = P.obj("unpack 0. 0.", x + 110, y + 30, 1, 2, ["float", "float"])
        tz = P.obj("trapezoid~ 0.01 0.99", x + 110, y + 90, 3, 1, ["signal"], w=130)
        wm = P.obj("*~", x, y + 150, 2, 1, ["signal"])
        ev = P.obj("line~", x + 110, y + 150, 2, 2, ["signal", "bang"])
        em = P.obj("*~", x, y + 180, 2, 1, ["signal"])
        pnu = P.obj("unpack 0. 0.", x + 110, y + 180, 1, 2, ["float", "float"])
        pL = P.obj("*~ 0.", x, y + 210, 2, 1, ["signal"])
        pR = P.obj("*~ 0.", x + 60, y + 210, 2, 1, ["signal"])
        ve = P.msg("vend %d" % v, x + 140, y + 240)
        P.con(vrt, 0, ph, 0); P.con(vrt, 1, ln, 1); P.con(vrt, 2, of, 1)
        P.con(vrt, 3, tzu, 0); P.con(tzu, 0, tz, 1); P.con(tzu, 1, tz, 2)
        P.con(vrt, 4, pnu, 0); P.con(pnu, 0, pL, 1); P.con(pnu, 1, pR, 1)
        P.con(vrt, 5, ev, 0)
        P.con(ph, 0, ln, 0); P.con(ln, 0, of, 0); P.con(of, 0, pl, 0)
        P.con(ph, 0, tz, 0)
        P.con(pl, 0, wm, 0); P.con(tz, 0, wm, 1)
        P.con(wm, 0, em, 0); P.con(ev, 0, em, 1)
        P.con(em, 0, pL, 0); P.con(em, 0, pR, 0)
        P.con(pL, 0, mixL, 0); P.con(pR, 0, mixR, 0)
        P.con(ph, 1, ve, 0); P.con(ve, 0, js, 0)

    # ---------------------------------------------------------------- fx
    fx = P.obj("route ftype cut res crsr crbits drv mku dsend dtime fb rmix rsize", 400, 1900, 1, 13, [""] * 13, w=420)
    P.con(route, 2, fx, 0)
    cut = P.obj("line~", 400, 1940, 2, 2, ["signal", "bang"])
    P.con(fx, 1, cut, 0)
    dry = {}
    for ch, mix, x in (("L", mixL, 20), ("R", mixR, 220)):
        svf = P.obj("svf~ 20000 0.1", x, 1980, 3, 4, ["signal"] * 4, w=100)
        sel = P.obj("selector~ 4 1", x, 2020, 5, 1, ["signal"], w=100)
        deg = P.obj("degrade~ 1. 24", x, 2060, 3, 1, ["signal"], w=100)
        drv = P.obj("*~ 0.3", x, 2100, 2, 1, ["signal"])
        th = P.obj("tanh~", x, 2130, 1, 1, ["signal"])
        mku = P.obj("*~ 3.433", x, 2160, 2, 1, ["signal"])
        P.con(mix, 0, svf, 0); P.con(cut, 0, svf, 1); P.con(fx, 2, svf, 2)
        P.con(fx, 0, sel, 0); P.con(mix, 0, sel, 1)
        P.con(svf, 0, sel, 2); P.con(svf, 1, sel, 3); P.con(svf, 2, sel, 4)
        P.con(sel, 0, deg, 0); P.con(fx, 3, deg, 1); P.con(fx, 4, deg, 2)
        P.con(deg, 0, drv, 0); P.con(fx, 5, drv, 1); P.con(drv, 0, th, 0)
        P.con(th, 0, mku, 0); P.con(fx, 6, mku, 1)
        dry[ch] = mku

    # ping-pong delay
    dsend = P.obj("*~ 0.", 460, 2200, 2, 1, ["signal"])
    P.con(dry["L"], 0, dsend, 0); P.con(dry["R"], 0, dsend, 0); P.con(fx, 7, dsend, 1)
    tinL = P.obj("tapin~ 4000", 460, 2240, 1, 1, ["tapconnect"], w=90)
    toutL = P.obj("tapout~ 250", 460, 2270, 1, 1, ["signal"], w=90)
    tinR = P.obj("tapin~ 4000", 460, 2300, 1, 1, ["tapconnect"], w=90)
    toutR = P.obj("tapout~ 250", 460, 2330, 1, 1, ["signal"], w=90)
    damp = P.obj("onepole~ 5000", 460, 2360, 2, 1, ["signal"], w=90)
    fb = P.obj("*~ 0.4", 460, 2390, 2, 1, ["signal"])
    fbt = P.obj("tanh~", 460, 2420, 1, 1, ["signal"])
    P.con(dsend, 0, tinL, 0); P.con(tinL, 0, toutL, 0); P.con(toutL, 0, tinR, 0); P.con(tinR, 0, toutR, 0)
    P.con(toutR, 0, damp, 0); P.con(damp, 0, fb, 0); P.con(fb, 0, fbt, 0); P.con(fbt, 0, tinL, 0)
    P.con(fx, 8, toutL, 0); P.con(fx, 8, toutR, 0); P.con(fx, 9, fb, 1)

    # reverb (Schroeder: 4 combs + allpasses)
    rin = P.obj("*~ 0.2", 700, 2200, 2, 1, ["signal"])
    for s in (dry["L"], dry["R"], toutL, toutR):
        P.con(s, 0, rin, 0)
    rdamp = P.obj("onepole~ 4500", 700, 2300, 2, 1, ["signal"], w=90)
    for i, (d, c) in enumerate(((29.7, 0.84), (37.1, 0.83), (41.1, 0.82), (43.7, 0.81))):
        comb = P.obj("comb~ 100 %s 0. 1. %s" % (d, c), 700 + i * 130, 2240, 5, 1, ["signal"], w=125)
        P.con(rin, 0, comb, 0); P.con(fx, 11, comb, 4); P.con(comb, 0, rdamp, 0)
    revs = {}
    for ch, (d1, d2), x in (("L", (5.1, 1.7), 700), ("R", (6.3, 2.9), 900)):
        a1 = P.obj("allpass~ 50 %s 0.6" % d1, x, 2340, 3, 1, ["signal"], w=110)
        a2 = P.obj("allpass~ 50 %s 0.6" % d2, x, 2370, 3, 1, ["signal"], w=110)
        rw = P.obj("*~ 0.", x, 2400, 2, 1, ["signal"])
        P.con(rdamp, 0, a1, 0); P.con(a1, 0, a2, 0); P.con(a2, 0, rw, 0); P.con(fx, 10, rw, 1)
        revs[ch] = rw

    # output
    outs = {}
    for ch, wet, x in (("L", toutL, 20), ("R", toutR, 220)):
        cl = P.obj("clip~ -1. 1.", x, 2460, 3, 1, ["signal"], w=90)
        P.con(dry[ch], 0, cl, 0); P.con(wet, 0, cl, 0); P.con(revs[ch], 0, cl, 0)
        outs[ch] = cl
    gain = P.ui("live.gain~", 20, 2500, 40, 136, 2, 5, ["signal", "signal", "", "float", "list"],
                (1024, 4, 40, 160), parameter_enable=1, varname="Volume", channels=2,
                saved_attribute_attributes=param("Volume", 0, -70, 6, 0, 4))
    P.con(outs["L"], 0, gain, 0); P.con(outs["R"], 0, gain, 1)
    plug = P.obj("plugout~", 20, 2660, 2, 0, [])
    P.con(gain, 0, plug, 0); P.con(gain, 1, plug, 1)

    return P.patcher([60.0, 60.0, 1400.0, 900.0], devicewidth=1068,
                     extra={"openrect": [0.0, 0.0, 1068.0, 169.0]})


# ============================================================================ INPUT DEVICE
def build_input():
    P = Patch()
    thisdev = P.obj("live.thisdevice", 20, 20, 1, 3, ["bang", "int", "int"])
    m_start = P.msg("start", 20, 50)
    js = P.obj("js vochop_in.js", 20, 300, 1, 2, ["", ""], w=120)
    P.con(thisdev, 0, m_start, 0); P.con(m_start, 0, js, 0)

    plugin = P.obj("plugin~", 300, 20, 2, 2, ["signal", "signal"])
    mono = P.obj("*~ 0.5", 300, 60, 2, 1, ["signal"])
    P.con(plugin, 0, mono, 0); P.con(plugin, 1, mono, 0)
    g = P.obj("*~ 1.", 300, 100, 2, 1, ["signal"])
    P.con(mono, 0, g, 0)
    rec = P.obj("record~ vochop_none 1", 300, 160, 3, 1, ["signal"], w=150)
    P.con(g, 0, rec, 0)
    snap = P.obj("snapshot~", 300, 200, 2, 1, ["float"])
    P.con(rec, 0, snap, 0)
    pfrac = P.obj("prepend frac", 300, 230, 1, 1, [""])
    P.con(snap, 0, pfrac, 0); P.con(pfrac, 0, js, 0)
    peak = P.obj("peakamp~ 30", 480, 160, 2, 1, ["float"])
    P.con(g, 0, peak, 0)
    plvl = P.obj("prepend lvl", 480, 190, 1, 1, [""])
    P.con(peak, 0, plvl, 0); P.con(plvl, 0, js, 0)

    # thru
    thL = P.obj("*~ 1.", 600, 60, 2, 1, ["signal"])
    thR = P.obj("*~ 1.", 680, 60, 2, 1, ["signal"])
    P.con(plugin, 0, thL, 0); P.con(plugin, 1, thR, 0)
    plug = P.obj("plugout~", 600, 100, 2, 0, [])
    P.con(thL, 0, plug, 0); P.con(thR, 0, plug, 1)

    rbus = P.obj("r vochop_bus_in", 160, 240, 0, 1, [""])
    pbus = P.obj("prepend bus", 160, 270, 1, 1, [""])
    P.con(rbus, 0, pbus, 0); P.con(pbus, 0, js, 0)
    sbus = P.obj("s vochop_bus_inst", 20, 340, 1, 0, [])
    P.con(js, 0, sbus, 0)

    route = P.obj("route rset rgo recbtn status autobtn", 160, 340, 1, 6, [""] * 6, w=240)
    P.con(js, 1, route, 0)
    pset = P.obj("prepend set", 160, 380, 1, 1, [""])
    P.con(route, 0, pset, 0); P.con(pset, 0, rec, 0)
    sel0 = P.obj("sel 0", 260, 380, 2, 2, ["bang", ""])
    P.con(route, 1, sel0, 0)
    P.con(sel0, 1, rec, 0)                       # 1 -> start recording
    dl = P.obj("deferlow", 260, 410, 1, 1, [""])
    t0b = P.obj("t 0 b", 260, 440, 1, 2, ["int", "bang"])
    P.con(sel0, 0, dl, 0); P.con(dl, 0, t0b, 0)
    P.con(t0b, 1, snap, 0)                       # first: read position
    P.con(t0b, 0, rec, 0)                        # then: stop

    # UI
    label(P, "VOCHOP IN", 20, 500, (6, 2, 110, 20), size=13, bold=1)
    recb = toggle(P, "Rec", 20, 540, (6, 26, 64, 28), "REC", oncolor=[1.0, 0.24, 0.2, 1.0])
    prec = P.obj("prepend rec", 20, 570, 1, 1, [""])
    P.con(recb, 0, prec, 0); P.con(prec, 0, js, 0)
    psr = P.obj("prepend set", 120, 570, 1, 1, [""])
    P.con(route, 2, psr, 0); P.con(psr, 0, recb, 0)
    auto = toggle(P, "Auto", 200, 540, (74, 26, 48, 28), "AUTO", oncolor=[1.0, 0.6, 0.2, 1.0])
    pauto = P.obj("prepend autorec", 200, 570, 1, 1, [""])
    P.con(auto, 0, pauto, 0); P.con(pauto, 0, js, 0)
    psa = P.obj("prepend set", 300, 570, 1, 1, [""])
    P.con(route, 4, psa, 0); P.con(psa, 0, auto, 0)

    gd = dial(P, "Gain", 400, 540, (128, 4, 44, 52), -24, 24, 0, 4)
    dbt = P.obj("dbtoa", 400, 600, 1, 1, [""])
    P.con(gd, 0, dbt, 0); P.con(dbt, 0, g, 1)
    td = dial(P, "Threshold", 460, 540, (174, 4, 44, 52), -60, 0, -32, 4, short="Thresh")
    pth = P.obj("prepend thresh", 460, 600, 1, 1, [""])
    P.con(td, 0, pth, 0); P.con(pth, 0, js, 0)

    thru = toggle(P, "Thru", 20, 640, (6, 60, 48, 16), "THRU", init=1)
    P.con(thru, 0, thL, 1); P.con(thru, 0, thR, 1)
    label(P, "Link", 100, 640, (58, 59, 30, 18), size=8.5)
    link = numbox(P, "Link", 140, 640, (84, 60, 38, 16), 1, 4, 1, 0)
    plk = P.obj("prepend lnk", 140, 670, 1, 1, [""])
    P.con(link, 0, plk, 0); P.con(plk, 0, js, 0)

    meter = P.ui("live.meter~", 560, 540, 10, 120, 1, 1, ["list"], (224, 6, 10, 150))
    P.con(g, 0, meter, 0)

    stat = P.ui("message", 20, 720, 210, 40, 2, 1, [""], (6, 82, 214, 36), text="Starting...",
                ignoreclick=1, bgcolor=[0.11, 0.118, 0.137, 1.0], textcolor=[0.86, 0.88, 0.92, 1.0],
                bgfillcolor_type="color", bgfillcolor_color=[0.11, 0.118, 0.137, 1.0], fontsize=9.5, linecount=2)
    pst = P.obj("prepend set", 20, 690, 1, 1, [""])
    P.con(route, 3, pst, 0); P.con(pst, 0, stat, 0)
    label(P, "put me on your mic track (Monitor: In)", 20, 780, (6, 122, 214, 16), size=8.5)
    label(P, "AUTO = starts when you speak", 20, 800, (6, 138, 214, 16), size=8.5)

    # bang dials at load so js gets values
    tb = P.obj("t b", 120, 20, 1, 1, ["bang"])
    P.con(thisdev, 0, tb, 0); P.con(tb, 0, td, 0); P.con(tb, 0, gd, 0); P.con(tb, 0, link, 0)

    return P.patcher([80.0, 80.0, 900.0, 700.0], devicewidth=242,
                     extra={"openrect": [0.0, 0.0, 242.0, 169.0]})


if __name__ == "__main__":
    write_amxd(build_instrument(), os.path.join(OUT, "VoChop.amxd"), b"iiii")
    write_amxd(build_input(), os.path.join(OUT, "VoChop Input.amxd"), b"aaaa")
    print("wrote", os.path.join(OUT, "VoChop.amxd"), "and", os.path.join(OUT, "VoChop Input.amxd"))
