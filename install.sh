#!/usr/bin/env bash
# Symlink dotfiles (from ./links) and claude/skills/*/ into ~/.claude/skills/. Idempotent.
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

echo "claude skills:"
for s in "$DIR"/claude/skills/*/; do
  n="$(basename "${s%/}")"
  link "claude/skills/$n" ".claude/skills/$n"
done
