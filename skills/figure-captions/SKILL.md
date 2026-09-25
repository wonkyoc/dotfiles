---
name: figure-captions
description: Method for writing, revising, and shortening figure and table captions — sentence one is a falsifiable claim, not a title; order is claim then explanation then decode; undefined terms are judged where the float actually lands on the rendered page; the artwork owns its own numbers. Load whenever drafting, editing, compressing, or reviewing a caption in any document (LaTeX \caption, Markdown figure text, slide captions). Every caption edit is verified by rendering the page, never by reading the source.
---

# Figure captions

A caption is read out of order — before the prose that owns its argument, and often instead of it. In a rapid review round a reviewer may read the first two pages and the figures alone. Write every caption to survive that reading: **the claim first, the explanation second, the decode last.**

Companion skills: `paper-figures` (production, sizing, palette, placement), `prose-compression` (the job-deletion method this file applies to captions), `academic-writing`.

## 0. Project hookup

| Hook | Default | Notes |
| --- | --- | --- |
| Root document | `main.tex` in the paper directory | override per repo |
| Build command | `latexmk -pdf -f -interaction=nonstopmode main.tex > build.log 2>&1` | never pipe into a command that can close the pipe early |
| Scratch dir for renders | the session scratchpad | keep renders out of the repo |
| System-name macro | `\sys` | appears in specimens below |

## 1. Sentence one is a claim, not a title

- The first sentence states what the figure *proves*, not what it *depicts*. **Test: could a reviewer disagree with it?** A title cannot be disagreed with; a claim can.
- Failure signature: the caption opens on a noun phrase naming the drawing — "Anatomy of the unified buffer", "Three ways to schedule the two inbound flows", "Handover timeline for a 70B model" — or on panel setup ("Today (left) the stages run in series").
- The claim usually already exists further down the caption. **Promoting it is most of the work.**

Specimen (a systems paper, Figure 12) — the claim was present all along, sitting third:

> **Before**: "Projected per-node handover critical path at production scale, model path only; both conditions share the storage fabric … \sys cuts the projected path by 53 %."
> **After**: "At projected K3 scale, \sys cuts the model-path handover time by 53 %, from 90.2 to 42.2 s per node."

- Numbers belong in the claim when they *are* the claim (53 %, 52–57 %, 7.5 s). One or two; a third turns the sentence back into a table.

## 2. Order: claim, then explanation, then decode

- Three zones, in this order: **the claim**, **why the figure supports it**, **the encoding legend** (what the numbers, arrows, and dashes mean). Never interleave them; a decode fragment stranded between two claim sentences ("Pod boot (faded) is the engine-side constant.") breaks the read.
- **Match the artwork's own order.** If the x-axis runs naive → strict → pipelining, the caption enumerates them in that order, not in argument order. A reader tracking caption against figure should never have to jump columns.
- Panel labels (a)/(b) follow the same rule: caption order = printed order.

## 3. Undefined terms are judged where the float *lands*

This is the rule that costs the most when ignored. A term's definition point must be compared against the caption's **rendered position**, not the `\input` line — floats move, and `[t]` will happily lift a figure to the top of a page whose text has not reached the definition yet.

- Render the page and read upward from the caption. Every technical term, symbol, and abbreviation in it must already be defined *above it on the page*, or be labeled in the artwork itself.
- **Page-1 floats are the worst case**: nothing in the paper is defined yet, so the caption may lean only on the artwork's own labels. A component name the figure prints in a box is fair; the same name used as if the reader knows its role is not.
- Three fixes, cheapest first: (1) gloss the term in place, (2) drop it and let the artwork's label carry it, (3) move the float.
- Moving the float: relocating the `\input` after the defining paragraphs is often *not* enough, because `[t]` still anchors to the top of the same page. `[b]` puts the caption below the column's text and is usually the fix.

Specimen (Figure 6): the caption's `readiness`, `byte floor`, `δ` and `W_m/β − δ` were all defined in a section that began at the *bottom* of the page whose *top* held the float. The `\input` moved after the two approach paragraphs and `[t]` became `[b]`; every term then resolved in the column above the caption.

## 4. Compression: the artwork owns its numbers

Apply `prose-compression` — delete jobs, not words — with three caption-specific tests first:

- **Before repeating a number, look at the rendered figure.** If it is printed on the bar, the axis, or the legend, delete it from the caption. Bar-value annotations, panel totals, and reference lines are all already read.
- **The restated-panel test.** A sentence that repeats the claim with panel labels attached ("(b) shows that strict wins when boot hides the transfer, while pipelining wins when it does not") is sentence one wearing a hat. It dies; (b) keeps only what is plotted.
- **The self-evident decode test.** "Bars show the critical-path stages for X and Y" tells the reader what they are looking at. If the legend prints the stage names and the rows are labeled, it dies.

Then the demotion ladder: a causal clause becomes a participle ("because both move about 700 GB" → "each moving about 700 GB"), a standalone caveat becomes a semicolon clause.

Specimens:

| Figure | Deleted | Why |
| --- | --- | --- |
| 8 | "removing the image manager adds 40.3 s, … persistence adds 15.9 s, … prefetch adds 3.9 s" | bars print `(+40.3)`, `(+15.9)`, `(+3.9)`; the body section states all three again |
| 9 | "slows the image from 7.3 to 9.2 s"; "even though it delivers the model slightly earlier" | both numbers printed; the shorter model bar is visible |
| 10 | the entire (b) explanation sentence | restated sentence 1 with panel labels |
| 1 | the component roster (mediator / image manager / transfer scheduler) | artwork labels all three; the design section defines them; a page-1 float cannot use them |

## 5. What never gets cut

Compression stops at these, however long the caption runs:

- **A number's scope and condition** — the model size, the trial count, the hardware. "at 13B" survives even when the three numbers it scoped are gone.
- **What the figure omits.** "Image delivery is omitted from both bars to isolate model movement" is a scoping decision a reviewer will price; deleting it reads as concealment.
- **The baseline's identity**, including the asterisk gloss (`seq*`) that the artwork prints but does not explain.
- **Projection vs. measurement.** A projected bar must say so in the caption, not only in the prose.

## 6. Verify (mandatory — never trust an unrendered caption)

Length, term order, and float placement are all invisible in the source.

1. Build: `latexmk -pdf -f -interaction=nonstopmode main.tex > build.log 2>&1`, then grep the log. **Never pipe `latexmk` into a command that can close the pipe early** (`| grep -c`, `| head`): it kills the run mid-write and corrupts `main.aux` and `main.pdf`, which then needs `latexmk -C` and a full rebuild.
2. Find the page: `grep -E 'newlabel\{fig:<name>\}' main.aux` — the second brace group is the page number.
3. Render: `pdftoppm -r 120 -f <page> -l <page> main.pdf <scratch>/pg -png`, then read the PNG. If `pdftoppm` is missing: `brew install poppler`.
4. Check against the artwork: every encoding the caption names exists; every number matches; every term resolves above it; the caption's enumeration order matches the figure's; total line count.
5. Confirm the page count did not grow, and that no reference or citation broke.

---

Provenance: generalized from `SKILL/captions.md` in the gpu-handover paper repo (2026-09-09). Specimens are kept verbatim as teaching cases; project paths and section numbers are lifted into §0 or described generically.
