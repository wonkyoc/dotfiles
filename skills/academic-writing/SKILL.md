---
name: academic-writing
description: Wonkyo's writing style and authorship rules for any project — brevity, information-flow cohesion, evidence discipline, the hyphen-chain ban, and the standing rule that the author writes the prose while the assistant scaffolds. Load this whenever drafting, editing, reviewing, or shortening any prose: papers, sections, abstracts, captions, design docs, README text, notes, commit messages, or replies. Use it even when the request looks like a small wording fix, and always load `writing-personal` alongside it.
---

# Writing style (portable)

Companion: the `writing-personal` skill — the author's personal habit profile (specimens, fixes, self-checks). Always load it together with this file; the assistant keeps it updated and corrects its patterns anytime they appear.

Related skills: `prose-compression` (shortening without losing claims), `figure-captions`, `paper-figures`, `paper-read-crosscheck`.

## 0. Project hookup

This skill is project-independent. A repo that uses it may pin the following in its own `AGENTS.md` (ChatGPT/Codex), `CLAUDE.md` (Claude), or a local `SKILL/README.md`; when they are absent, use the defaults given here.

| Hook | Default | Example override |
| --- | --- | --- |
| Markdown unwrap tool | `scripts/unwrap_md.py` bundled with this skill | a repo-local copy |
| Annotation package | `trackchanges` (LaTeX) | none; use Markdown comments or inline `[CD: ...]` |
| Assistant's editor initials | `CD` | any initials registered with `\addeditor{}` |
| Reference-needed macro | `\rn[CD]{...}` | `[citation needed]` in Markdown |
| System-name macro | `\sys` | the project's own macro |

## 1. Authorship (who writes)

- **The author drives all manuscript writing.** The assistant (Claude, ChatGPT, or any agent) does not write or rewrite prose, sections, abstracts, or arguments unless the author explicitly says so ("take this over", "draft this for me"). This holds in every project, not just the one this rule came from.
- Default response to a writing goal: **scaffold, do not solve.** Give an ordered TODO of sub-steps and at most one hint per step. A hint points at an approach or a consideration; it does not work out the wording. Then stop and let the author write.
- When the author brings back a draft, critique it: flag the single most important issue first, hold the rest unless asked.
- Every draft iteration (standing rule): (1) read all of the author's inline comments and suggest a better option for each; (2) leave advisor-style margin notes that point at issues without rewriting the prose.
- **Citation-needed rule:** whenever a sentence makes a factual or quantitative claim without a citation, flag it with the reference-needed macro. Never invent the citation.
- Permitted without being asked: point to literature or repo docs to read, stress-test reasoning (counterexamples, edge cases, hidden assumptions), check a fact/number/citation, fix LaTeX or Markdown mechanics, and other chores the author explicitly delegates.

### LaTeX annotation gotcha (`trackchanges`)

`trackchanges` underlines edit-command text with the `soul` package, which cannot tokenize fragile commands. In the *underlined argument* (the annotated sentence of `\annote`, the added text of `\add`, the new text of `\change`), prefix fragile commands with `\protect`: `\protect\cite{key}`, `\protect\ref{..}`, `\protect\cref{..}`, and the project's system macro when it expands to something containing `\xspace`. The note text of `\annote`/`\note`/`\rn` is not underlined and needs no `\protect`. Do not use `\soulregister`; it breaks `\annote`'s internal conditionals.

## 2. Voice and length

- Be brief. Cut hedges, throat-clearing, and restated context.
- Prefer short sentences over long ones; one idea per sentence.

## 3. Structure

- Use bullet points by default. Switch to prose only when explicitly instructed, or when the content is a continuous narrative (abstract, problem statement) where bullets would fragment the argument.
- Use numbered section headings: `1. Introduction`, `1.1 Background`, `1.2 System model`.
- Keep heading depth shallow (3 levels max) unless the document requires more.
- **Never hard-wrap prose in Markdown**: one paragraph or list item per logical line, no line breaks at 80 columns. The author reads in preview mode, where wrapped source lines fragment paragraphs. Repair violations with the bundled `scripts/unwrap_md.py` (rewrites in place; preserves code fences, tables, headings, and frontmatter).

## 4. Writing a design principle

- A principle states the single core idea and the consequences it produces. It is not a list of components or requirements: "the system should have X" is a component, not a principle.
- Structure: state the one idea, derive its consequences, then map to the components that realize it.
- Separate benefits from costs. Only what the idea buys belongs as a principle point; a problem the idea creates is a challenge handled by a mechanism, not a co-equal consequence.
- Be precise with load-bearing terms; do not overclaim. If the mechanism is nuanced (exclusive ownership with controlled transfer, not a permanent single owner), state the precise version — it is usually stronger and more defensible than the loose one.

## 5. Design vs implementation

- **Design** answers what the mechanism is and why it works, stated so a reimplementer on another stack would recognize it (abstractions, protocols, invariants, rationale). **Implementation** answers how it was built here (concrete APIs, versions, deployment choices, platform-specific workarounds).
- Two tests to place a sentence: (1) if it were removed, would the reader still understand the mechanism and the contribution? If yes, it is implementation. (2) Would it hold for anyone reimplementing the design, or is it specific to my libraries and testbed? Specific to the stack means implementation.
- Collect platform-specific realization in a dedicated Implementation section; keep design subsections conceptual. Deployment details go in Implementation, not in the abstraction.
- Measured costs are neither design nor implementation; they are Evaluation.

## 6. Cohesion (connect paragraphs without connective words)

- English prose coheres through information flow, not connective words. Core device: **old information first, new information last.** End a sentence on the new idea, then make that idea the subject or starting point of the next.
- Thread the topic: repeat the key noun or keep the same grammatical subject across sentences instead of reaching for "however" / "therefore" / "in addition". Repetition of the topic is the link.
- Order ideas so the relation is implied (problem then fix, general then specific, claim then evidence), and use parallel structure for parallel content. The sequence itself signals the relationship.
- Reserve connectives for genuine turns: "however" only when the next sentence reverses an expectation, "therefore" only when the conclusion is not already obvious from order. If every paragraph opens with a connective, cut most of them; it reads as non-native.
- **Test before adding a connective:** read the two sentences without it. If the relation is still clear, delete the word; keep it only when removing it causes a misread.
- Reference: Gopen and Swan, "The Science of Scientific Writing" (*American Scientist*, 1990); Williams, *Style: Lessons in Clarity and Grace*.

## 7. Evidence

- Back factual or quantitative claims with evidence: a citation, a measurement, a link, or an inline reference.
- If the supporting evidence is not at hand, search before asserting the claim.
- Mark unsupported claims explicitly rather than stating them as fact.
- When citing a paper, quote the verbatim sentence and keep it visually separate from your own words, so the author can check the reading against the source.

## 8. Hyphen chains (HARD RULE — no exceptions)

- **Never coin a multi-word hyphen chain.** Three or more words strung together with hyphens into an improvised compound is banned outright: `keep-the-link-busy-always`, `one-quantity-two-names`, `release-at-DRAM-arrival`, `~3x-model-bytes`, `record-and-prefetch`. They read as compressed note-taking, not prose.
- Applies everywhere: paper prose, captions, figure labels, scaffold comments, margin notes, commit messages, and chat. There is no context where the chain is the right form.
- **The fix is a clause, not a shorter chain.** Unfold it into ordinary words: `keep-the-link-busy-always` → *keep the link busy at all times*; `release-at-DRAM-arrival` → *release the GPU when the checkpoint reaches DRAM*. If unfolding it costs a whole sentence, the idea was too big for a compound in the first place.
- Established compounds are unaffected — dictionary or field-standard forms, not coinages: *end-to-end*, *all-or-nothing*, *out-of-bounds*, *Mixture-of-Experts*, *GPU-to-GPU*. **Test:** would this appear, hyphenated, in someone else's paper who had never read mine? If no, it is a coinage — unfold it.
- Two-word modifiers follow the ordinary rule: hyphenate only when the pair jointly modifies a following noun.

## 9. What to avoid

- Marketing adjectives ("powerful", "seamless", "robust") unless quantified.
- Repeating the same point in multiple bullets.
- Trailing summaries that restate what the reader just read.

---

Provenance: generalized from `SKILL/writing.md` in the gpu-handover paper repo (2026-09-09), with project-specific paths, macros, and the Tripod system name lifted into §0.
