/*
  Runs source/voice.genexpr sample by sample in JS (tiny GenExpr -> JS translation)
  to check the voice logic:  node tests/sim_voice.js
*/
const fs = require("fs"), path = require("path"), assert = require("assert");
const src = fs.readFileSync(path.join(__dirname, "..", "source", "voice.genexpr"), "utf8").replace(/\/\/.*$/gm, "");
const params = {}, hist = {};
let body = src.replace(/Param\s+(\w+)\(([^)]*)\);/g, (m, n, v) => { params[n] = Number(v); return ""; })
              .replace(/History\s+(\w+)\(([^)]*)\);/g, (m, n, v) => { hist[n] = Number(v); return ""; });
const locals = new Set();
body.replace(/(^|[;{}\s])([a-z_]\w*)\s*=(?!=)/gi, (m, a, n) => { if (!(n in params) && !(n in hist)) locals.add(n); });
body = body.replace(/\b([a-z_]\w*)\b/gi, (m) => (m in hist ? "H." + m : m in params ? "Pm." + m : m));
body = body.replace(/\bnoise\(\)/g, "(Math.random()*2-1)").replace(/\b(cos|min|max|abs|floor)\(/g, "Math.$1(").replace(/\bsamplerate\b/g, "SR");
const fn = new Function("H", "Pm", "SR", "var " + Array.from(locals).join(",") + ";" + body +
  "; return [out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12];");
function voice() { return { H: Object.assign({}, hist), Pm: Object.assign({}, params) }; }
function run(v, n, SR) { const o = []; for (let i = 0; i < n; i++) o.push(fn(v.H, v.Pm, SR)); return o; }
const SR = 44100;

// one-shot: plays s0..s1 once at rate 1, then done
let v = voice(); Object.assign(v.Pm, { s0: 100, s1: 300, cs0: 150, cs1: 250, mode: 0, amp: 1, hold: 1, trig: 1 });
let o = run(v, Math.round(SR * 0.25), SR);
const doneAt = o.findIndex((x) => x[10] == 1);
assert(Math.abs(doneAt / SR * 1000 - 200) < 2, "one-shot length 200 ms, got " + doneAt / SR * 1000);
assert.strictEqual(o[doneAt][11], 1, "done carries the trigger id");
assert(Math.abs(o[Math.round(SR * 0.1)][0] - 200) < 1, "position advances 1 ms per ms");
assert(o[Math.round(SR * 0.1)][1] > 0.99, "full gain mid-slice");
// cloud: starts with the direct head, then grains take over and it keeps sounding
v = voice(); Object.assign(v.Pm, { s0: 100, s1: 300, cs0: 150, cs1: 250, mode: 2, amp: 1, hold: 1, trig: 1, gsz: 60 });
o = run(v, SR * 2, SR);
assert(o[200][1] > 0.3 && o[200][3] == 0, "direct head first");
const late = o.slice(SR, SR + 4410);
const gsum = late.map((x) => x[3] + x[5] + x[7] + x[9]);
assert(Math.min(...gsum) > 0.95 && Math.max(...gsum) < 1.05, "grain gains sum to ~1: " + Math.min(...gsum) + " " + Math.max(...gsum));
assert(late.every((x) => [2, 4, 6, 8].every((k) => x[k] >= 150 - 1e-6 && x[k] <= 250 + 1e-6)), "grains stay inside the vowel region");
assert(!o.some((x) => x[10] == 1), "cloud never ends while held");
v.Pm.hold = 0; o = run(v, SR, SR);
const end = o.findIndex((x) => x[10] == 1);
assert(end > 0 && Math.abs(end / SR * 1000 - 200) < 5, "release 200 ms then done, got " + end / SR * 1000);
// loop wraps, repeat stays within rlen
v = voice(); Object.assign(v.Pm, { s0: 0, s1: 100, mode: 3, rlen: 30, amp: 1, hold: 1, trig: 1 });
o = run(v, SR, SR);
assert(o.every((x) => x[0] >= 0 && x[0] <= 30.001), "repeat stays in first 30 ms");
// kill: 5 ms fade, then done
v = voice(); Object.assign(v.Pm, { s0: 0, s1: 1000, mode: 1, amp: 1, hold: 1, trig: 1 }); run(v, 1000, SR);
v.Pm.kill = 1; o = run(v, SR * 0.05, SR);
const kd = o.findIndex((x) => x[10] == 1);
assert(kd > 0 && kd / SR * 1000 < 6, "kill ends within ~5 ms, got " + kd / SR * 1000);
// reverse one-shot
v = voice(); Object.assign(v.Pm, { s0: 100, s1: 200, mode: 0, rev: 1, amp: 1, hold: 1, trig: 1 });
o = run(v, SR * 0.05, SR);
assert(o[100][0] < 200 && o[2000][0] < o[100][0], "reverse runs backwards");
// kill + retrigger in the same block: the new note must sound
v = voice(); Object.assign(v.Pm, { s0: 0, s1: 1000, mode: 1, amp: 1, hold: 1, trig: 1 }); run(v, 1000, SR);
v.Pm.kill = 2; v.Pm.trig = 2; o = run(v, SR * 0.05, SR);
assert(o[o.length - 1][1] > 0.9 && !o.some((x) => x[10] == 1), "retriggered voice keeps sounding");
// reverse + repeat starts inside the repeat window (no silent lead-in)
v = voice(); Object.assign(v.Pm, { s0: 0, s1: 600, mode: 3, rev: 1, rlen: 125, amp: 1, hold: 1, trig: 1 });
o = run(v, SR * 0.02, SR);
assert(o[441][1] > 0.9 && o[441][0] <= 125, "reverse repeat audible at once");
console.log("voice sim OK");
