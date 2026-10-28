/*
  Minimal Max [js] environment for running vochop.js in Node (tests only).
  load(file, {audio: Float32Array, sr}) -> { ctx, out: [...captured outlet messages] }
*/
const fs = require("fs");
const vm = require("vm");

function readWav(path) {
  const b = fs.readFileSync(path);
  let p = 12, fmt = null, data = null;
  while (p + 8 <= b.length) {
    const id = b.toString("ascii", p, p + 4), len = b.readUInt32LE(p + 4);
    if (id === "fmt ") fmt = { ch: b.readUInt16LE(p + 10), sr: b.readUInt32LE(p + 12), bits: b.readUInt16LE(p + 22) };
    if (id === "data") data = b.subarray(p + 8, p + 8 + len);
    p += 8 + len + (len & 1);
  }
  const n = data.length / 2 / fmt.ch, x = new Float32Array(n);
  for (let i = 0; i < n; i++) x[i] = data.readInt16LE(i * 2 * fmt.ch) / 32768;
  return { x, sr: fmt.sr };
}

function load(file, opt) {
  opt = opt || {};
  const out = [];
  const audio = { x: opt.audio || new Float32Array(0), sr: opt.sr || 44100 };
  class Buffer {
    constructor(name) { this.name = name; }
    framecount() { return audio.x.length; }
    length() { return audio.x.length / audio.sr * 1000; }
    peek(ch, start, n) { return Array.from(audio.x.subarray(start, start + n)); }
  }
  class Task {
    constructor(fn, obj) { this.fn = fn; this.interval = 0; }
    schedule() { } cancel() { } repeat() { }
  }
  class LiveAPI {
    constructor(cb, path) { if (opt.liveapi) return opt.liveapi(cb, path); throw new Error("no live"); }
  }
  const ctx = {
    jsarguments: ["vochop.js", "testbuf"], post: (s) => { if (opt.verbose) process.stdout.write(String(s)); },
    outlet: (...a) => out.push(a.flat()), setinletassist() { }, setoutletassist() { },
    arrayfromargs: (args) => Array.prototype.slice.call(args), messagename: "",
    Buffer, Task, LiveAPI, JSON, Math, Date, Array, String, Number, Object, isNaN, parseInt, parseFloat,
  };
  ctx.patcher = { filepath: "" };
  vm.createContext(ctx);
  const src = fs.readFileSync(file, "utf8");
  vm.runInContext(src, ctx, { filename: file });
  ctx.me = ctx; // "this" in Max js
  ctx.setAudio = (x, sr) => { audio.x = x; audio.sr = sr || 44100; };
  return { ctx, out };
}

module.exports = { load, readWav };
