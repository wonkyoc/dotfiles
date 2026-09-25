---
name: prompt-language-coach
description: Correct grammar, word choice, and awkward English in every user prompt, in any repository, and keep the researcher's shared self-study ledger with mistake counts, word history, and recurring-pattern flags. Preserve meaning, tone, and technical terms; skip code, logs, quotations, and deliberate shorthand.
---

# Prompt language coach

Check the user's wording before answering the request. This skill is shared by Claude and ChatGPT/Codex through the dotfiles `skills/` folder, so every repository and assistant writes to one ledger.

## 1. In the reply

- When a prompt contains a useful correction, add a short **Language note** with the improved wording. Quote only the affected phrase or sentence.
- Explain the reason in plain language when the correction is not self-evident. Focus on grammar, idiom, word choice, or an expression that sounds unnatural.
- **Flag recurring patterns.** When `coach.py add` reports `FLAG RECURRING` or `FLAG PERSISTENT` for a correction, add one line to the note naming the pattern and its count, e.g. *Recurring: missing article before a singular noun (9th prompt; last on 2026-09-24).* When it reports a repeated word, say what was written before (*“could be reclaimed” again; earlier you wrote “can be reclaimable”*). Do not flag first occurrences.
- Preserve the intended claim, confidence, technical meaning, and conversational tone. Do not upgrade an uncertain statement into a fact.
- Do not correct code, commands, logs, paper quotations, filenames, or intentional note fragments unless the user asks.
- Do not let the correction replace or delay the requested work. Answer the substantive request as well.
- If the prompt is already natural, omit the language note rather than inventing a change.

For longer drafts or formal research prose, also load the `academic-writing` and `writing-personal` skills. Their detailed writing rules take precedence over this lightweight prompt check.

When preserving a prompt in a research repository, keep the user's raw wording unchanged when it is evidence or an idea record. Put the correction or interpretation in a separate field, consistent with the repo's `AGENTS.md` or `CLAUDE.md`.

## 2. Self-study ledger

The researcher has authorized recording their prompt prose for self-study. Append one entry per reviewed user message, including messages that need no correction. Do not backfill unseen history or log pasted third-party material, code, credentials, or other secrets. If prose must be omitted, say so in the entry rather than calling it verbatim.

**Location.** One global ledger, not one per repo: `$LANGUAGE_COACH_DIR`, else `learning/` in the dotfiles repo (`coach.py path` prints it). The dotfiles repo is public, so `learning/` is git-ignored; never commit it or copy it into a project repo. Writing there is outside the current workspace, so the assistant may need to ask for write permission once per session.

**Write through the script, never by editing the files.** Save the entry as JSON in a scratch file (or pipe it) and run, from any directory:

```sh
python3 <this skill's directory>/scripts/coach.py add entry.json
```

The script validates the entry, replaces an existing entry with the same `id` (so revisions are not counted twice), regenerates `language-study.md`, and prints each correction's running count, flags, and repeated words. Use that output for §1's flag line.

### Entry fields

- `id`: stable, unique: `<date>-<project>-<short-task>`, plus a suffix for later messages in the same task.
- `date` (`YYYY-MM-DD`), `project` (repo or conversation topic), `original` (verbatim eligible prose), `corrected` (complete reusable version), `errors` (list), optional `style_notes` (list of strings, never counted).
- Each error: `category` (`grammar` or `expression`), `pattern` (an id from `references/patterns.json`), `sentence` (one-based index), `original` (affected phrase), `correction`, `reason` (brief), and `words`.
- `words` is the word history: a list of `{"from": "<what they wrote>", "to": "<correct word or phrase>"}` for the lexical item the lesson is about (content words, prepositions, fixed phrases). Use `"from": ""` when the word was omitted. Leave it empty for articles, punctuation, and word order; those are tracked by `pattern`.

```json
{"id": "2026-09-24-xyz-paper-draft-name", "date": "2026-09-24", "project": "xyz-paper",
 "original": "A draft name should be a comb with date and commit hash",
 "corrected": "A draft filename should combine the date and commit hash.",
 "errors": [{"category": "expression", "pattern": "word-choice", "sentence": 1,
   "original": "be a comb with", "correction": "combine",
   "reason": "Combine means join; a comb is a hair tool.",
   "words": [{"from": "comb", "to": "combine"}]}]}
```

### Counting rules

Count one issue per independent correction, assigned to one category and one pattern. Grammar includes agreement, tense, articles, and countability. Expression includes incorrect word choice, idiom, and unnatural constructions. Prepositions and verb patterns take whichever category fits the case. Group overlapping rewrites of the same issue. Do not count optional stylistic preferences, technical vocabulary, acceptable variants, deliberate shorthand, or uncertainty as mistakes. Add a new pattern id to `references/patterns.json` only when none fits.

Keep the distinction between total issues, prompts with issues, and sentences with issues. These are recorded observations, not an English-proficiency score.

### Other commands

- `coach.py stats [--days 14]`: totals and every pattern's flag, for a progress question.
- `coach.py word <text>`: the history of one word or phrase.
- `coach.py check`: validate the ledger and re-render after a manual repair.

Link `language-study.md` when recording begins or when the user asks; do not repeat cumulative totals in every reply. Continue substantive work alongside coaching.
