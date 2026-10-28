# VoChop: a vocal chopper for Ableton Live 12 + Push 3

Record a phrase and VoChop chops it into **words** right away, then splits each
word into **parts** (syllables, e.g. *every → ev · ery*). Everything lands on an
8×8 pad grid you can play polyphonically from Push 3, any MIDI keyboard, or the
on-screen grid with your mouse.

```
VoChop/
  VoChop.amxd          <- instrument (MIDI track)   - the chopper/sampler
  VoChop Input.amxd    <- audio effect (mic track)  - records your voice into VoChop
  vochop*.js           <- device code (must stay in the same folder as the .amxd files)
  vochop_asr_model/    <- offline speech model for AI WORDS (English, 28 MB)
  package.json         <- lets AI WORDS install its speech engine
  source/              <- generator + plain .maxpat copies
```

**Keep the whole folder together.** Put it somewhere permanent, e.g.
`Music/Ableton/User Library/VoChop/`. The devices load their scripts from this folder, and
your recorded takes are saved here as WAV files.

---

## 1. Setup (2 minutes)

1. **MIDI track:** drag `VoChop.amxd` onto a MIDI track.
2. **Mic track:** drag `VoChop Input.amxd` onto the audio track your microphone comes in on.
   Set that track's **Monitor to "In"**, so the device receives audio even when the track isn't armed.
   Both devices show **Link 1** by default, which means they're paired. Use Link 2–4 for more pairs.
3. Press **REC** (on either device), say or sing a phrase, and press **REC** again.
   Within about 0.1 s the pads light up: one colour per word.
   *Or skip recording:* drag any audio file or clip onto the **DROP** box.
4. Click pads on the device to check the chop. Click the **top** of a pad for louder hits and the **bottom** for softer ones,
   or Shift-click for full velocity. You can drag across pads to play them in a run.
   **BIG VIEW** opens a large 8×8 window with the word text on every pad.

## 2. Push 3 (controlled mode)

VoChop listens to plain MIDI notes, so Push needs a layout where every pad has its own note:

1. Select the VoChop track (Push plays the selected track).
2. On Push press **Layout/Scale** → set **Chromatic** (In Key **off**) and layout **Sequential ↑**
   (Push 3 calls it *Sequent ^*).
3. Click **LEARN** on VoChop, then press the **bottom-left pad** on Push. Done:
   every pad now matches the grid on screen.

Push's encoders control the device parameters (pitch, filter, delay and so on) like any other device.

**PUSH PADS (beta):** turns your Push pads into VoChop's colours. Words light up in their colour
and parts in grey. It takes over the pad matrix through Live's control-surface API, and
switching it off gives the pads back. It's marked beta because I couldn't test it on real hardware.
If the colours look wrong, leave it off. The note method above always works.

## 3. How the pads are laid out

| Mode | Layout |
|---|---|
| **Words + Parts** (default) | Each **column is a word**. The **top pad = the whole word**; the pads **below it = its parts**. 9–16 words: the grid splits into a top half (words 1–8) and a bottom half (words 9–16) |
| **Syllables** | Every part in reading order (top-left → right, row by row), up to 64 |
| **Word List** | Every word in reading order, up to 64 (for long phrases) |
| **Keys** | Plays **one** slice chromatically across all pads. Pick the slice by tapping its pad first, or by clicking it on the waveform. With **TUNE** on (the default), pitch is set from the slice's detected pitch, so the pads play *real notes* (C3 plays C3) |

## 4. AI WORDS: chopping by real words

There are two chopping engines:

* **Instant (always on):** acoustic analysis of pauses and loudness valleys, done in about 30–80 ms. It's very good at
  parts and syllables. For *words* it works best when you leave small gaps between them, because in fast
  speech the gap inside "wel-come" can look like a gap between two words.
  The **Words** and **Syllables** knobs control how eagerly it splits.
* **AI WORDS (one click):** offline speech recognition (sherpa-onnx, Apache-2.0) figures out *which*
  gaps are real word boundaries, and the acoustic engine snaps each cut to the exact sample. The pads
  then show the **actual words** ("every", "one", …). In my tests this improved word-boundary accuracy from 69% to
  90% (F1) and took about 50 ms per phrase. Everything runs on your computer and no audio is uploaded.
  The model is English-only.
  * The **first time** you switch it on, it installs the speech engine (about 35 MB from npm, 1–3 minutes,
    one time only). The status line shows progress. The model itself is already in the folder.
  * If the install hangs (e.g. your Max has no npm), open Terminal in the VoChop folder and run
    `npm install`, then toggle AI WORDS off and on again.

## 5. Controls

**Left:** `REC` · `DROP` (audio file/clip) · `Mode` · `Trigger` (One-Shot / Gate / Loop) · `LEARN` + `Base` note ·
`<` `>` previous/next **take** (every recording is kept as a WAV) · `BIG VIEW` · `MAKE CLIP` ·
`AI WORDS` · `PUSH PADS` · `Link`

**MAKE CLIP** writes a MIDI clip into the first empty slot of the VoChop track that replays your phrase as
pad hits, quantised to 1/16 at the current tempo. Fire it, then rearrange the notes to remix your words.

**Play:** Pitch (±24 st) · Attack · Release · Spread (stereo voice spread) · Poly (1–8 voices) · Velocity
sensitivity · **Stutter** (tempo-synced repeat while you hold a pad: 1/4 … 1/16T)

**FX:** Filter (Off/LP/HP/BP) + Cutoff + Reso · Crush (bit/rate) · Drive (tanh saturation) ·
**Ping-pong delay** (Delay amount, tempo-synced Time, Feedback) · **Reverb** (amount + Size) · Volume

**Toggles:** `REVERSE` · `SNAP` (nudges every slice to the nearest note of Live 12's current **Scale**, for
in-key chops) · `TUNE` (Keys mode follows detected pitch) · `CHOKE` (a new hit cuts the previous one, classic chop
style)

**VoChop Input:** `REC` · `AUTO` (arms; recording starts when you speak and stops after 1.5 s of silence) ·
`Gain` · `Thresh` (level for AUTO) · `THRU` (pass the mic through) · `Link`

## 6. Troubleshooting

* **"Nothing recorded"**: VoChop Input isn't receiving audio. Check that the mic track's input is right and that Monitor is set to **In**,
  and that both devices use the same **Link** number.
* **Pads don't match Push**: redo LEARN (Push layout must be Chromatic + Sequential).
* **Grid is blank or "js: can't find file"**: the `.js` files must sit next to the `.amxd` files. Re-copy the whole
  folder, then reload the device.
* **Too many / too few words**: turn the **Words** knob (left = fewer, right = more), or switch on AI WORDS.
* **Too many / too few parts**: turn the **Syllables** knob.
* **Takes don't come back after reopening the set**: the WAVs are in the VoChop folder. If you moved the folder,
  just drag the WAV back onto DROP.
* **If Live refuses to open an .amxd** (corrupt device message): in Live, create an empty *Max Instrument*,
  click its edit button, open `source/VoChop.maxpat` in Max, select all, copy, paste into the empty device, and
  save it next to the .js files. Do the same with `source/VoChop Input.maxpat` and a *Max Audio Effect*.

## 7. Notes

* Mono recording, up to 60 s per take, 8 voices, sample-accurate playback with click-free fades.
* Pitch detection uses YIN per slice. Snap and Tune change pitch the classic sampler way, so playback speed changes too.
* Licences: speech engine sherpa-onnx (Apache-2.0); model icefall zipformer small-en (Apache-2.0).
