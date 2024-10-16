#!/usr/bin/env bash

# set 256 color profile where possible
#if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
#    export TERM=gnome-256color
#elif infocmp xterm-256color >/dev/null 2>&1; then
#    export TERM=xterm-256color
#fi
#
#for file in ~/.bash/.{bash_prompt,bash_exports,bash_aliases}; do
#    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
#        source "$file";
#    fi
#done;

export TERM=xterm-256color

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t 0 || tmux new -s 0
fi

source ~/.bashrc
