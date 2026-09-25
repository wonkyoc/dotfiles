#!/usr/bin/env bash
# Link the OpenAI markdown theme into a repo so VSCode's built-in preview can
# load it. The preview webview only serves files under the open workspace
# folder, so the stylesheet has to live inside the repo; `markdown.styles` is
# set globally to the relative path ".vscode/openai-markdown.css".
#
# Usage: link-markdown-theme.sh [repo-dir]   (defaults to cwd)
set -euo pipefail
SRC="$HOME/projects/personal/dotfiles/vscode/openai-markdown.css"
DEST="${1:-$PWD}/.vscode/openai-markdown.css"
mkdir -p "$(dirname "$DEST")"
ln -sfn "$SRC" "$DEST"
echo "linked $DEST -> $SRC"
