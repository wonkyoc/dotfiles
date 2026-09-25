# dotfiles

    git clone <this repo> ~/projects/personal/dotfiles
    ~/projects/personal/dotfiles/install.sh

`install.sh` symlinks the entries in `links` into `$HOME` and every
`skills/<name>/` into both assistants' user skill folders, so one copy of each
skill serves Claude and ChatGPT in every repository:

| Assistant | Folder it reads | Link created |
| --- | --- | --- |
| Claude Code | `~/.claude/skills/` | `~/.claude/skills/<name> -> skills/<name>` |
| Codex (ChatGPT) | `~/.agents/skills/` | `~/.agents/skills/<name> -> skills/<name>` |

Add a skill by creating `skills/<name>/SKILL.md` and re-running `install.sh`.
Edits to an existing skill need no reinstall. Do not copy skills into project
repos; put project-specific paths in the project's `AGENTS.md`, `CLAUDE.md`, or
`SKILL/README.md` ("project hookup"), which the skills read.

## Layout
- `skills/<name>/SKILL.md`: shared agent skills (frontmatter `name`, `description`), usable as `/<name>` in Claude and `$<name>` in Codex. `agents/openai.yaml` is optional Codex UI metadata that Claude ignores.
- `learning/`: private data written by skills (the `prompt-language-coach` ledger). Git-ignored because this repo is public.
- `links`: one `source target` pair per line; edited by hand, read by both scripts.
- `uninstall.sh`: removes only symlinks that point into this repo.
- `_to_delete/`: staged for removal, ignored by git.

## Skills
- `academic-writing`, `writing-personal`: writing style, authorship rules, personal habit profile.
- `prose-compression`, `figure-captions`, `paper-figures`: cutting to length, captions, LaTeX figures.
- `paper-read-crosscheck`: verify a reported paper reading against the source.
- `research-task-coordination`: peer research tasks and handoffs.
- `prompt-language-coach`: English corrections with mistake counts, word history, and recurring-pattern flags.
