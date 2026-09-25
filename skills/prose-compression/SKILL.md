---
name: prose-compression
description: Method for cutting a section, paragraph, abstract, or caption to length without losing any claim — reverse-outline first, delete whole jobs, merge, demote, and only then squeeze words. Load whenever the author asks to shorten, tighten, compress, trim, cut a page, reclaim space, or fit a page/word limit in any document (LaTeX, Markdown, docs, README). Use it even for a "just make this shorter" request; concessions and scoped numbers are never cut.
---

# Compression

Compression is deletion of *jobs*, not squeezing of words. A section shrinks honestly when whole sentences die because their job is done elsewhere or not needed — not when surviving sentences are starved into telegraphese. Work top-down; the word pass comes last because it yields the least.

Companion skills: `academic-writing` (the style rules the survivors must still obey), `writing-personal` (the author's habit profile; section numbers below point into it), `figure-captions` (this method applied to captions).

## 0. Project hookup

Nothing to configure. Two things vary by project and should be read from the repo before cutting: the **length target** (page limit, word count, column count) and the **build command** used in the Verify step.

## 1. Order of operations

**1. Reverse-outline the target** (`writing-personal` §2.15 — revise on the skeleton, not inside finished prose, because cohesion ties glue good paragraphs to their neighbors): write one line per sentence naming its JOB — the claim it advances, not its topic. Compression decisions are made on this list, never in the prose.

**2. Delete whole jobs.** A sentence dies when it fails one of these tests:

- **Owned elsewhere.** Mechanism belongs to the design section; figure decode belongs to the caption; definitions belong to their first-use section. Run the delete-both-ways test (`writing-personal` §2.8, the caption/body division of labor): deleting the sentence here must cost this section no argument.
- **Restating follow-up** (§2.13 — of the two sentences per result, the second earns its place only by adding something). After a result sentence, the follow-up survives only as an *inference* (it converts the measurement into a property of the system), a *disarmed objection*, or a *consequence*. "This is because [mechanism the design already gave]" dies.
- **Section narration** (§2.10 — scaffold language is stage direction, not dialogue). "This section describes…", "We now turn to…", "The takeaway is…" die.
- **Derivable content.** Arithmetic the reader completes (140 GB / 8 GPUs), symmetric clauses ("and vice versa" spelled out), restated context from two sentences ago.
- **Vague purpose clauses.** "to understand both our benefits and limitations" — if the purpose is not falsifiable, it is not informative.

**3. Merge sentences that share a subject or a job.** Two-sentence cause+effect becomes one sentence with a colon; an enumeration of conditions becomes a clause list; a scope sentence ("X is out of scope") becomes a parenthetical on the sentence it scopes. Pick the connector by relationship: **colon** for claim→payoff, **semicolon** for parallel twins (action; defense), **subordination** (which/because/although) when one half is background.

**3b. The demotion ladder** — how a fact gets cheaper without dying. A **sentence** is an independent clause standing alone: full stop, full attention. A **clause** still has its own subject and verb but rides inside another sentence (", which share one storage fabric"). A **phrase** has no subject–verb pair ("on one shared storage fabric"). Demote facts the reader must know but not dwell on; the level signals the importance. Never demote past phrase into a coined compound word — that is where hyphen chains breed.

Worked example: "Both handovers share the fabric for fairness." (sentence) → ", which share one storage fabric" (clause) → "on one shared storage fabric" (phrase).

**4. Charge rent for headers.** A `\paragraph{}` or sub-heading earns its keep only if a reader would jump to it; two headers over four sentences merge into one or none.

**5. Word pass, last.** Hedges ("around", "typically" — one, never both), "in order to", nominalizations ("perform an analysis of" → analyze), doubled modifiers. Smallest yield; do it only after the structure is settled.

## 2. Hard limits — compression must never produce

- **Hyphen-chain coinages or dropped articles** (`academic-writing` §8; `writing-personal` §1.1) — the author's known failure modes under length pressure. If a compressed sentence needs a chain, the idea was too big to compress.
- **A number cut loose from the condition that gives it meaning** (§2.9, §2.11): a percentage without its scope, a speedup without its baseline, a measurement without the condition that does the inferential work (what was removed, what was held constant).
- **Deleted concessions, caveats, or limitations** — these are load-bearing assets (`writing-personal` §6), and reviewers price their absence higher than their length.
- **A dangling reference**: every forward/backward ref and figure mention in the survivors must still resolve.

## 3. Verify

1. Rebuild the document and confirm the length actually moved (pages, words, or column inches — whichever the target is stated in).
2. Read the survivors aloud in sequence. The merge seams are where edit residue breeds (`writing-personal` §1.9 — leftover fragments from a half-applied edit).
3. Confirm each figure and table still has at least one body sentence citing it.
4. Quote the lines saved back to the author, so the cut is reviewable rather than invisible.

---

Provenance: generalized from `SKILL/compress.md` in the gpu-handover paper repo (2026-09-09). Section pointers into `writing-personal` are kept but glossed in plain words, per the clarity-and-simplicity rule.
