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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/wonkyoc/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/wonkyoc/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/wonkyoc/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/wonkyoc/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.bashrc

. "$HOME/.cargo/env"

export PATH="$HOME/.poetry/bin:$PATH"
