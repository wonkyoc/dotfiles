---
name: paper-figures
description: Conventions for producing figures and tables in LaTeX papers — TikZ by default, one file per float, numbers cross-checked against the prose before drawing, width budgeted to the text block, a per-project color palette held constant across figures, and a verification loop that renders the page and reads it. Load whenever creating, editing, replacing, resizing, recoloring, or placing a figure or table in any *.tex file, and whenever a figure's numbers need to be checked against the text.
---

# Figure production

Companion skills: `figure-captions` (what the caption must say and how to verify it), `academic-writing`, `prose-compression`.

## 0. Project hookup

Fill these in per repo (in the repo's `AGENTS.md`, `CLAUDE.md`, or `SKILL/README.md`); the defaults below are the fallbacks.

| Hook | Default | Notes |
| --- | --- | --- |
| Figure directory | `paper/figures/fig_<name>.tex` | one float per file |
| Table directory | `paper/tables/tab_<name>.tex` | same convention |
| Root document | `paper/main.tex` | build target |
| Numbers of record | the destination `.tex`, then `context/manuscript.md`, then `*_estimate.md` | see §2 |
| Color palette | define once per project, record it here | see §4 |
| Text-block width | measure it for the actual class/geometry | see §3 |

## 1. Format

- Default to **TikZ** for diagrams (timelines, system diagrams, flowcharts, simple charts). Vector, font-matched to the document, diff-friendly, no external asset.
- Use **PDF** (vector, exported from Inkscape/Illustrator/matplotlib) only when TikZ would be impractical: complex shading, hand-drawn shapes, plots with many data points.
- Never use **PNG/JPEG** for diagrams or charts. Acceptable only for screenshots or photographs.
- Factor every figure environment into its own file with a header comment naming its source section, and `\input{}` it from the section file, so figure code does not interrupt reading the prose. Tables follow the same convention.

## 2. Numbers and prose consistency

- **Before drawing**, list the numbers the figure will display and check each one against the destination `.tex` file (the file that will `\input` or contain the figure) *and* against the project's notes that hold the numbers of record.
- If sources disagree, match the destination `.tex` file so the figure agrees with surrounding prose, and **explicitly flag the discrepancy to the author** — never silently pick a number.
- Verify the arithmetic in the figure (sums, percentages, savings) against the arithmetic stated in the prose.

## 3. Sizing

- Budget the width before drawing. For a single-column 11pt `article` with 1in margins, the body text width is **~165 mm**; a two-column ACM/IEEE class is roughly **~85 mm** per column and **~178 mm** full width. Measure the real value with `\the\textwidth` / `\the\columnwidth` rather than assuming.
- Keep the *total* figure width — bars plus labels plus legend — under that budget. `\centering` only re-centers; it does not clip overflow.
- For timeline-style figures, pick a scale, in units per mm, that fits, then verify by rendering. Example that worked for a ~70 s timeline in one column: `x=1.4mm` to `1.6mm` per second.
- Use `\scriptsize\sffamily` or `\footnotesize\sffamily` for in-figure text; `\tiny` only for narrow segments where larger text would not fit.

## 4. Color palette (one per project, held constant)

**Rule: the same color means the same concept in every figure of the document.** Define the palette once, record it in §0 of the project's local note, and reuse it — a reader who learns "red = checkpoint" in Figure 3 must not meet a red bar meaning something else in Figure 9.

Example palette from a systems paper, as a shape to copy rather than values to reuse:

| Concept | RGB |
| --- | --- |
| Checkpoint | 215, 75, 60 (red) |
| Scheduling | 145, 105, 200 (purple) |
| Image pull | 95, 150, 180 (steel blue) |
| Model load / prefetch | 80, 160, 105 (green) |
| PCIe D2H/H2D | 205, 115, 45 (orange) |
| System's overlap window (outline) | 40, 165, 105 |
| "Saved" / inactive overlay | 90, 95, 110, dashed border, ~10 % fill |

Keep the palette distinguishable in grayscale and to color-blind readers: vary lightness as well as hue, and give adjacent categories a second cue (hatching, dash pattern, label).

## 5. Placement

- Insert the figure environment immediately after the paragraph that first references it, and let `[t]` place it. Note that `[t]` anchors to the top of the page the declaration falls on, which can put the figure *above* the text that defines its terms; check the render, and use `[b]` when the caption depends on definitions in that column (`figure-captions` §3).
- Add a forward reference (`see Figure~\ref{fig:<name>}`) in the prose at the point of first mention.
- Caption: see `figure-captions` — sentence one states the claim, terms are checked against where the float lands, and the artwork owns its own numbers.
- Label naming: `fig:<topic>-<aspect>` (e.g. `fig:handover-timeline`, `fig:system-arch`); tables use `tab:`.

## 6. Verification loop (mandatory)

Every figure change is verified visually, not just by clean compilation:

1. Build: `latexmk -pdf -interaction=nonstopmode -halt-on-error -g main.tex`. Never pipe `latexmk` into a command that can close the pipe early (`| head`, `| grep -c`) — it kills the run mid-write and corrupts `main.aux` / `main.pdf`.
2. Find the page: `grep -E 'newlabel\{fig:<name>\}' main.aux` (second brace group), or grep `pdftotext -f N -l N main.pdf -` for caption text.
3. Render it: `pdftoppm -r 200 -f <page> -l <page> main.pdf <scratch>/preview -png`.
4. **Read the PNG** and check: in-figure text legible at print size, no overflow past the text block, colors distinct, labels not clipped, palette consistent with the other figures.
5. If `pdftoppm` is missing: `brew install poppler`.

---

Provenance: generalized from `SKILL/figures.md` in the gpu-handover paper repo (2026-09-09). The Tripod palette and directory layout are kept as a worked example; per-project values belong in §0.
