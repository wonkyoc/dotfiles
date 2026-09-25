#!/usr/bin/env bash
# Symlink dotfiles (from ./links) and every skills/<name>/ into the skill folders of
# each assistant, so Claude and ChatGPT/Codex share one copy. Idempotent.
#   ~/.claude/skills/<name>   Claude Code
#   ~/.agents/skills/<name>   Codex (ChatGPT) user scope
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_TARGETS=(.claude/skills .agents/skills)

link() {
  local src="$DIR/$1" dst="$HOME/$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  skip $dst (real file exists; move it aside first)"; return
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"; echo "  $dst -> $src"
}

echo "dotfiles:"
grep -v '^\s*#' "$DIR/links" | while read -r src dst; do
  [ -n "$src" ] && link "$src" "$dst"
done

for t in "${SKILL_TARGETS[@]}"; do
  echo "skills -> ~/$t:"
  # drop dangling links into this repo (e.g. the old claude/skills/ path)
  for l in "$HOME/$t"/*; do
    if [ -L "$l" ] && [ ! -e "$l" ] && [[ "$(readlink "$l")" == "$DIR"/* ]]; then
      rm "$l"; echo "  removed stale $l"
    fi
  done
  for s in "$DIR"/skills/*/; do
    n="$(basename "${s%/}")"
    link "skills/$n" "$t/$n"
  done
done

if [ -d "$HOME/.codex/skills" ]; then
  for s in "$DIR"/skills/*/; do
    n="$(basename "${s%/}")"
    [ -e "$HOME/.codex/skills/$n" ] && echo "  note: ~/.codex/skills/$n is an old copy; Codex now reads ~/.agents/skills, remove the duplicate"
  done
fi
true
