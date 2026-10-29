/*
  Engine smoke tests in the Max mock:  node tests/test_engine.js <some-phrase.wav>
  Checks pad surface per layout, note map, voices triggered by word / rest / key pads, choke.
*/
const { load, readWav } = require("./maxmock");
const path = require("path");
const assert = require("assert");
const w = readWav(process.argv[2]);
const { ctx, out } = load(path.join(__dirname, "..", "vochop.js"));
ctx.setAudio(w.x, w.sr);
ctx.init(); ctx.start(); ctx.bootT = 0;
ctx.recLen = 0;
ctx.analyzeAll();
const W = ctx.words.length;
assert(W >= 3, "words found: " + W);
// voice messages = outlet 0: [voice, kind, ...]
const take = () => out.splice(0, out.length);
const vm0 = () => out.filter((m) => m[0] === 0).map((m) => m.slice(1));

// ---- surface: Notes layout (default)
assert.strictEqual(ctx.P.layout, 1);
let r = ctx.surf[56]; assert(r.t == "word" && r.k == 0, "top-left = word 1");
r = ctx.surf[48]; assert(r.t == "rest" && r.k == 0, "row 2 = rest of word 1");
r = ctx.surf[0]; assert(r.t == "key" && r.n >= 64, "bottom-left = key, note " + r.n);
assert.strictEqual(ctx.noteOfRole(ctx.surf[57]), 1);
assert.strictEqual(ctx.noteOfRole(ctx.surf[49]), 33);

// ---- every word has 1-3 parts and the rest slice sits inside the word
for (const x of ctx.words) {
  assert(x.np >= 1 && x.np <= 3, "parts " + x.np);
  if (x.rest) assert(x.rest.s > x.s && x.rest.e == x.e, "rest inside word");
}
console.log("words:", ctx.words.map((x) => (x.s / w.sr).toFixed(2) + "-" + (x.e / w.sr).toFixed(2) + "/" + x.np).join(" "));

// ---- word pad -> one-shot voice with s0/s1 of the word, retune off (AutoTune 0)
take();
ctx.padclick(57, 100);
let v = vm0().filter((m) => m[1] === "g");
const g = {}; v.forEach((m) => g[m[2]] = m[3]);
assert(Math.abs(g.s0 - ctx.words[1].s / w.sr * 1000) < 0.01, "s0");
assert.strictEqual(g.mode, 0); assert.strictEqual(g.hold, 1);
assert(vm0().some((m) => m[1] === "c" && m[2] === 0), "no correction for plain pads");
assert(ctx.sel === ctx.words[1], "pad selects word 2");
ctx.padclick(57, 0);

// ---- choke: second word pad kills the first voice
take();
ctx.padclick(56, 100);
const firstVoice = vm0().find((m) => m[1] === "g" && m[2] === "trig")[0];
take();
ctx.padclick(58, 100);
assert(vm0().some((m) => m[0] === firstVoice && m[1] === "g" && m[2] === "kill"), "choke kills previous chop voice");
ctx.padclick(56, 0); ctx.padclick(58, 0);

// ---- key pad: chromatic 4ths, C bottom-left, word's own note mid-grid, plays the pad's real pitch
ctx.padclick(56, 100); ctx.padclick(56, 0);       // select word 1
const org = ctx.originNote();
assert.strictEqual(((ctx.surf[0].a % 12) + 12) % 12, 0, "bottom-left is a C");
assert.strictEqual(ctx.surf[1].a - ctx.surf[0].a, 1, "+1 per column");
assert.strictEqual(ctx.surf[8].a - ctx.surf[0].a, 5, "+5 per row (4ths)");
const oPad = ctx.surf.findIndex((r) => r && r.t == "key" && r.a == org);
assert(oPad >= 8 && oPad < 40, "word's own note sits mid-grid: pad " + oPad);
assert.strictEqual(ctx.surf[oPad].n, ctx.HOME, "own note = MIDI 96");
take();
const keyPad = 0, kn = ctx.surf[keyPad].n;
ctx.padclick(keyPad, 100);
v = vm0().filter((m) => m[1] === "g"); const k = {}; v.forEach((m) => k[m[2]] = m[3]);
assert.strictEqual(k.mode, ctx.P.keys == 0 ? 2 : k.mode, "cloud mode");
const t = vm0().find((m) => m[1] === "t");
const pt = ctx.ensurePitch(ctx.words[0]);
if (pt > 0) {
  const midi = 69 + 12 * Math.log2(t[2] / 440);
  assert(Math.abs(midi - ctx.surf[keyPad].a) < 1e-6, "plays the pad's own pitch " + midi + " vs " + ctx.surf[keyPad].a);
  console.log("word 1 pitch", pt.toFixed(1), "own note", org, "bottom-left", ctx.surf[0].a, "->", midi.toFixed(2));
}
take();
ctx.padclick(keyPad, 0);
assert(vm0().some((m) => m[1] === "g" && m[2] === "hold" && m[3] === 0), "release on key up");

// ---- MIDI notes from the track: 0-31 words, 32-63 rests, 64+ keys
take(); ctx.note(2, 90); assert(ctx.sel === ctx.words[2]); ctx.note(2, 0);
if (ctx.words[0].rest) { take(); ctx.note(32, 90); assert(ctx.sel === ctx.words[0].rest, "note 32 = rest of word 1"); ctx.note(32, 0); }

// ---- Words layout: 4 row pairs
ctx.p("layout", 0);
assert(ctx.surf[56].t == "word" && ctx.surf[40].t == "word" && ctx.surf[40].k == 8 && ctx.surf[32].t == "rest");
// ---- Seq layout
ctx.p("layout", 2);
assert(ctx.surf[47].t == "step" && ctx.surf[47].i == 7 && ctx.surf[16].t == "step" && ctx.surf[16].i == 24);
assert(ctx.surf[8].t == "spage" && ctx.surf[0].t == "sres" && ctx.surf[7].t == "slen");
// ---- octave / page buttons
ctx.p("layout", 1); ctx.octup(1); assert.strictEqual(ctx.P.octave, 1);
ctx.p("layout", 0); ctx.octup(1); assert.strictEqual(ctx.P.page, 1);
// ---- labels
assert.deepStrictEqual(Array.from(ctx.syllables("pozdrav")), ["poz", "drav"]);
assert.deepStrictEqual(Array.from(ctx.syllables("vrijeme")), ["vri", "je", "me"]);
assert.deepStrictEqual(Array.from(ctx.syllables("svima")), ["svi", "ma"]);
assert.strictEqual(ctx.restText("svima", 0.5), "ma");
assert.strictEqual(ctx.restText("pozdrav", 0.45), "drav");
// ---- voice end: a stale "done" (old trigger id) is ignored, the current one frees the voice
take(); ctx.p("page", 0); ctx.p("layout", 1); ctx.padclick(56, 100);
const vi = vm0().find((m) => m[1] === "g" && m[2] === "trig");
ctx.vend(vi[0], vi[3] - 1); assert.strictEqual(ctx.voices[vi[0]].busy, 1, "stale done ignored");
ctx.vend(vi[0], vi[3]); assert.strictEqual(ctx.voices[vi[0]].busy, 0, "done frees voice");
ctx.padclick(56, 0);
console.log("engine tests OK");
