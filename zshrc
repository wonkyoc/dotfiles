

# * Prompt
#https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{#5FFF00}"
zstyle ':vcs_info:*' unstagedstr "%F{#D7005F}"
zstyle ':vcs_info:*' formats ":%F{#FFD787}%c%u%b"
zstyle ':vcs_info:git:*:-all-' command =git

local p="%F{#767676}"
local n="%F{#87D787}%n${p}"
local m="%F{#87D7FF}%m${p}"
local d="%F{#8787FF}%~${p}"
local x="%F{#FF5F5F}%?${p}"
local h="%F{#FFD700}%!${p}"
local r="%F{#8A8A8A}%#${p}"
local v="\${vcs_info_msg_0_}${p}"
#export PS1="${n}:${m} ${d}${v}"$'\n'"(${x}:${r})-%f "
export PS1="${n}:${m} ${d} (${x}) ${r}%f "

function precmd() {
    vcs_info
}
