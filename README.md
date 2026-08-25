# dotfiles

    git clone <this repo> ~/projects/personal/dotfiles
    ~/projects/personal/dotfiles/install.sh

`install.sh` symlinks the entries in `links` into `$HOME` and every
`claude/skills/<name>/` into `~/.claude/skills/<name>`, so personal Claude
skills follow this repo across machines.

## Layout
- `claude/skills/<name>/SKILL.md`: personal Claude skills (frontmatter `name`, `description`); usable as `/<name>`.
- `links`: one `source target` pair per line; edited by hand, read by both scripts.
- `uninstall.sh`: removes only symlinks that point into this repo.
- `_to_delete/`: staged for removal, ignored by git.
