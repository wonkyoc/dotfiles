#!/usr/bin/env bash
# Remove the symlinks created by install.sh. Only removes a target if it is a
# symlink pointing into this repo; real files and foreign links are left alone.
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

unlink_if_ours() {
  local dst="$HOME/$1"
  if [ -L "$dst" ] && [[ "$(readlink "$dst")" == "$DIR"/* ]]; then
    rm "$dst"; echo "  removed $dst"
  elif [ -e "$dst" ]; then
    echo "  kept $dst (not a link into $DIR)"
  fi
}

echo "dotfiles:"
grep -v '^\s*#' "$DIR/links" | while read -r src dst; do
  [ -n "$dst" ] && unlink_if_ours "$dst"
done

echo "claude skills:"
for s in "$DIR"/claude/skills/*/; do
  unlink_if_ours ".claude/skills/$(basename "${s%/}")"
done
