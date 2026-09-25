---
name: paper-read-crosscheck
description: Protocol for when the author reports reading or reviewing a paper ("I read X — the key idea is…", "X is not related", "X scoops us") — retrieve the source, cross-check the reading against the paper's own words on mechanism / contribution / setting, quote verbatim when contradicting, push back when a coarse verdict would move bookkeeping without its reasoning, then land the result in notes and the related-work map. Load whenever the author summarizes, dismisses, compares, or ranks a paper, and whenever a reading is about to drive a citation, tier, or related-work decision.
---

# Paper-read cross-check

**Standing agreement (2026-08-25):** the author's reading of a paper is a claim like any other — verify it against the source before it drives a bookkeeping or manuscript decision. Agreement is reported as agreement; disagreement is reported plainly, with the paper's own text as evidence. Do not soften.

Companion skills: `academic-writing` (§7 evidence discipline), `writing-personal`.

## 0. Project hookup

Where the result lands varies by repo; find these before recording anything, and ask the author if the repo has no equivalent.

| Hook | Typical location | Purpose |
| --- | --- | --- |
| Reading notes | `context/reading-notes/` with a `TEMPLATE.md` | one note per paper |
| Related-work map | `context/repo_docs/related/related-map.md` | one row per paper: source, delta, tier |
| Bibliography | a `.bib` file — **often Zotero-synced; never hand-edit it.** Ask the author for the citation | entries may carry `file:` paths to local PDFs |
| Section scaffolds | related-work section hints, section comments, open-gate lists | must be swept for stale characterizations |

## 1. Cross-check before recording

- **Retrieve the paper before accepting the characterization.** In order of preference: the local PDF (bib entries often carry `file` paths; Zotero/OneDrive storage), the bib abstract, then arXiv or the venue page via web fetch. If none is reachable, say so and mark every derived claim unverified.
- Compare the author's summary against the paper's own words on three axes:
  - **(a) mechanism** — what the system actually does;
  - **(b) claimed contribution** — what the authors say is new, often narrower than the mechanism;
  - **(c) setting** — who runs what, on whose hardware, under what trust assumptions.
- **Report the comparison explicitly:** what the read got right, what the paper states differently, what neither confirms. Quote or cite the paper's sentence when contradicting the author — a contradiction without evidence is just a second opinion.
- **Quote-then-insight rule (2026-08-28): every reference to a specific clause in a paper carries BOTH the original text verbatim (or near-verbatim, with its section/figure locus) AND the interpretation.** A paraphrase alone strands the author — they cannot find the original to check the reading. Applies in chat, notes, and map rows alike; a note's mechanism bullets should let the author grep the PDF for the quoted words.
- **A partial read caps confidence downstream.** "I read a bit of X" means the note's read depth says *skim*, and any claim resting only on the partial read goes into "Verify before citing", not into a map delta stated as fact.

## 2. Assert when the viewpoint needs elaboration

- A coarse verdict ("not related", "not a threat", "similar idea") is not enough to drive a tier change, a demotion, or a delta rewrite. When the verdict arrives without its reasoning, **ask for the missing piece by name**: which axis carries the verdict (mechanism, consumer, setting, trust), and which of the paper's claims it touches.
- Push back when the verdict and the evidence point in different directions, when the verdict contradicts an earlier row or note, or when it would **silently vacate a role in the scaffold** (e.g. a named prior-art slot) with nothing to fill it. Name the vacancy and propose the replacement.
- The author decides. The assertion's job is to make the decision explicit, not to win it: one direct statement of the concern, the evidence, and the consequence — then record whichever ruling the author makes.

## 3. Land the result

- **Reading note**: the author's verdict verbatim where it matters, provenance marked (whose read, what depth, what was transcribed vs. verified), unresolved items in a "Verify before citing" list.
- **Map row**: flip the source field to `note:`, correct the delta and tier, and propagate to the citation queue if the tier changed.
- **Sweep the scaffolds**: any related-work hint, section comment, or open-gate entry that repeats the old characterization gets corrected in the same pass — a demoted paper left in a hint resurfaces as prose later.

## 4. Specimens

- **Checkmate (2026-08-24, the founding case):** the author's correction — the core idea is the network gradient tap, not async checkpointing — was cross-checked against the bib abstract, confirmed, and propagated to note, map, and the related-work hint. The original scan row had over-credited the paper with the async move.
- **PCcheck (2026-08-25):** "not related at all", from a partial read, demoted a *named* row and vacated the release-point precedent slot; the slot was refilled with grouped cites from the same lineage. The verdict was recorded on trust, with the media / no-stall claims parked in "Verify before citing" — under this protocol, the cross-check against the PDF happens *before* the demotion is stated as fact.

---

Provenance: generalized from `SKILL/paper-review.md` in the gpu-handover paper repo (2026-09-09). Repo-specific note, map, and bib paths are lifted into §0; the two specimens are kept as teaching cases.
