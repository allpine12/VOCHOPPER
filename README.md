# VoChop: vokalni chopper za Ableton Live 12 + Push 3

Snimiš frazu i VoChop je odmah izreže na **riječi**, a svaku riječ na 1–3 **dijela** (slogove).
Riječi sviraš kao chopove ili kao instrument: odabereš riječ i odsviraš akord, a riječ se
autotuneom spegla u te note i i dalje se razumije.

```
VoChop/
  VoChop.amxd          <- instrument (MIDI traka). Jedini koji ti treba.
  VoChop Input.amxd    <- rezerva: samo ako AUDIO FROM ne radi na tvom sustavu
  vochop*.js           <- kod devicea (mora ostati u istom folderu kao .amxd)
  package.json         <- AI WORDS si s ovim instalira speech engine
  source/              <- generator (gen.py), gen~ kod glasa, .maxpat kopije
  tests/               <- testovi (Node), nisu potrebni za rad
```

**Cijeli folder drži zajedno** na stalnom mjestu, npr. `Music/Ableton/User Library/VoChop/`.
Takeovi se spremaju kao WAV u isti folder.

Preuzimanje s GitHuba: zeleni gumb **Code → Download ZIP**, raspakiraj i preimenuj folder u `VoChop`.

---

## 1. Postavljanje

1. Povuci `VoChop.amxd` na **MIDI traku**.
2. U deviceu, u izborniku **AUDIO FROM** (ispod REC) odaberi odakle dolazi mikrofon: `Ext. In`
   (pa kanal desno, npr. `1`) ili neku audio traku. Nikakva dodatna traka ni device nisu potrebni.
3. Pritisni **REC**, reci frazu, pa opet **REC**. Za ~0,1 s padovi se upale, svaka riječ u svojoj boji.
   - **AUTO**: snimanje krene kad počneš govoriti i stane nakon 1,5 s tišine (prag = dial *Thresh*).
   - **THRU**: čuješ mikrofon kroz VoChop.
   - Možeš i povući audio fajl ili clip na **DROP**.
4. Ako AUDIO FROM ostane prazan ili ne snima, tvoja verzija Livea ne daje instrumentima audio ulaz.
   Tada stavi `VoChop Input.amxd` na audio traku s mikrofonom (Monitor: In). Oba devicea moraju imati isti **Link**.

## 2. Push 3

Kad odabereš VoChop traku, Push padovi automatski prelaze u VoChop raspored. Čim odeš na drugu traku,
Push se vraća na svoje. Gumb **PUSH PADS** to potpuno isključuje.

**Gornja dva reda uvijek su riječi:**
- 1. red (gore): cijela riječ, npr. `svima`
- 2. red: drugi dio riječi, npr. `-ma`

**Ispod toga je layout** (gumb *Layout* iznad ekrana ili izbornik na deviceu):

| Layout | Donjih 6 redova |
|---|---|
| **Notes** (default) | Klavijatura u ljestvici Live seta (kao Push, kvarte). Svira **odabranu riječ** na toj noti. Akord = riječ u akordu. |
| **Seq** | Step sequencer u clip: redovi 3–6 = 32 koraka, red 7 = stranice, red 8 = rezolucija (1/32–1/4) i duljina clipa (1–8 taktova). Klikneš riječ gore, pa korak gdje će stajati. |
| **Words** | Cijeli grid su riječi: 4 para redova = 32 riječi (riječ + drugi dio). |

U Notes/Seq gornja dva reda pokazuju 8 riječi. **Page** (ili Octave tipke na Pushu u Words/Seq) prebacuje na riječi 9–16, 17–24, 25–32.
U Notes layoutu Octave tipke na Pushu mijenjaju oktavu klavijature.

**Gumbi iznad ekrana** (Push banke parametara): `Rec · Undo · Layout · Page · Oct- · Oct+ · Keys · Choke`.
Undo vraća prethodni take. Ekran pokazuje banke **Main** (Layout, Keys, AutoTune, Key, Pitch, Attack, Release, Volume),
**FX** (Reverb, Size, Delay, Time, Feedback, Crush, Drive, Cutoff) i **Chop**.

**Snimanje u clip:** naoružaj traku i snimaj kao inače (Session Record). Što odsviraš na Push padovima upisuje se u clip.
Note u clipu znače:

| Nota | Što svira |
|---|---|
| 0–31 (C-2…G0) | riječi 1–32 |
| 32–63 (G#0…D#3) | drugi dio riječi 1–32 |
| 64–127 | odabrana riječ na toj visini. C5–B5 = najbliža oktava glasu, svaka oktava gore/dolje = ±12 |

Nota riječi ujedno **odabire** riječ, pa se u clipu snima i koju si riječ svirao.
**MAKE CLIP** napravi clip u kojem su sve riječi fraze redom.

## 3. Zvuk

- **Keys** (kako note na klavijaturi drže zvuk):
  - **Cloud** (default): riječ krene normalno, pa se na samoglasniku pretvori u mekani granularni sustain dok držiš tipku.
    Veličina zrna = dial **Grain**.
  - **Loop**: cijela riječ u petlji.
  - **Repeat**: ponavlja početak riječi u ritmu (**Rate**: 1/4…1/16T).
  - **One-Shot**: odsvira jednom.
- **Pads** (kako sviraju riječi): One-Shot · Gate · Loop · Repeat. **CHOKE** je uključen: nova riječ prekida prethodnu.
- **AutoTune** 0–100: na riječima ih ispegla u notu. Na 100 % je glas savršeno autotuneovan, a riječ se i dalje razumije.
  **Key**: *Scale* = ljestvica Live seta, ili jedna nota (C…B). Note na klavijaturi su uvijek 100 % ugođene.
- FX: Filter (LP/HP/BP) + Cutoff/Reso · Crush · Drive · ping-pong **Delay** (Time, Feedback) · **Reverb** (Size) · Volume.
- Ostalo: Pitch (±24), Attack, Release, Spread, Poly (1–8 glasova), Velocity, Reverse, In dB (ulazno pojačanje).

## 4. Rezanje i AI WORDS

- **Bez AI-ja** (uvijek uključeno, ~50 ms): VoChop traži stanke i doline glasnoće.
  Klikovi, udisaji i šum prije prve riječi se odbacuju, a početak svake riječi traži se točno na sampleu.
  **Words** dial: lijevo = manje riječi, desno = više. **Syllables** dial: koliko lako dijeli na slogove.
- **AI WORDS** (dodatna opcija): offline prepoznavanje govora (NVIDIA Parakeet v3, 25 jezika, **i hrvatski**).
  Jezik prepoznaje sam. Pronađe granice riječi i napiše riječi na padove (`pozdrav`, `svima`, …).
  - Prvo uključivanje jednokratno instalira engine (npm, 1–3 min) i skida model (~670 MB). Status pokazuje postotak.
  - Na mojim testovima: bez AI-ja F1 granica riječi ≈ 0,81, s AI-jem ≈ 0,91. Broj riječi je s AI-jem gotovo uvijek točan.
  - Sve se vrti na tvom računalu, ništa se ne šalje van.
  - Ako instalacija zapne (npr. nemaš npm), u Terminalu u VoChop folderu pokreni `npm install`, pa isključi i uključi AI WORDS.

## 5. Problemi

- **AUDIO FROM je prazan / snimka je tišina:** koristi `VoChop Input.amxd` (vidi 1.4). Max konzola ispisuje `VoChop: device audio inputs: N`. Ta poruka mi pomaže ako mi je pošalješ.
- **Push padovi se ne prebace:** provjeri da je PUSH PADS uključen i da je odabrana VoChop traka. Push mora biti spojen na komp.
- **Boje na Pushu izgledaju krivo:** javi, paleta je podešena bez stvarnog hardvera.
- **Gumbi iznad ekrana ne pokazuju Rec/Undo…:** u deviceu su isti gumbi (REC, UNDO, OCT -/+, Layout, Keys, CHOKE).
- **"js: can't find file":** `.js` fajlovi moraju biti uz `.amxd`. Kopiraj cijeli folder pa ponovno učitaj device.
- **Live ne želi otvoriti .amxd:** u Liveu napravi prazan *Max Instrument*, klikni Edit, otvori `source/VoChop.maxpat`,
  sve kopiraj u prazan device i spremi ga uz `.js` fajlove.

## 6. Za developere

- `python3 source/gen.py` iz koda generira oba `.amxd` (i `.maxpat` kopije). Glas je gen~ codebox: `source/voice.genexpr`.
- Testovi (Node 18+, bez Maxa): `node tests/sim_voice.js` · `node tests/test_engine.js fraza.wav` · `node tests/eval_chop.js <korpus>`.
- Licence: sherpa-onnx (Apache-2.0), NVIDIA Parakeet TDT 0.6B v3 (CC-BY-4.0).
