
## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# * Prompt
#https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*' stagedstr "%F{#5FFF00}"
#zstyle ':vcs_info:*' unstagedstr "%F{#D7005F}"
#zstyle ':vcs_info:*' formats ":%F{#FFD787}%c%u%b"
#zstyle ':vcs_info:git:*:-all-' command =git

#local p="%F{#767676}"
local p="%F{243}"
local n="%F{114}%n${p}"
local m="%F{117}%m${p}"
local d="%F{105}%1d${p}"
local x="%F{203}%?${p}"
local h="%F{#FFD700}%!${p}"
local r="%F{245}%#${p}"
#local v="\${vcs_info_msg_0_}${p}"
#export PS1="${n}:${m} ${d}${v}"$'\n'"(${x}:${r})-%f "
export PS1="${n}:${m} ${d} (${x}) ${r}%f "

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"

#function precmd() {
#    vcs_info
#}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/wonkyoc/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/wonkyoc/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/wonkyoc/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/wonkyoc/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.poetry/bin:$PATH"

alias ls='ls --color=auto -lh'
