# clean.zsh: zsh colors matching the vim-clean colorscheme
# https://github.com/wonkyoc/vim-clean
#
# Source at the END of zshrc (after oh-my-zsh or plugins, so it wins):
#   source "${${(%):-%N}:A:h}/zsh/clean.zsh"
# Variant follows vim-clean: export CLEAN_VARIANT=paper|linen|white (default paper)
#
# Themes: prompt, git status, completion menu, ls (GNU and BSD), grep, man
# pages, and zsh-syntax-highlighting / zsh-autosuggestions when installed.

typeset -gA _clean
() {
  local -A c
  case ${CLEAN_VARIANT:-paper} in
  paper)
    c[bg]='#f7f6f5'
    c[fg]='#191919'
    c[muted]='#7b7a7a'
    c[linenr]='#a7a6a6'
    c[nontext]='#c6c5c5'
    c[hair]='#dcdbdb'
    c[line]='#eeedec'
    c[accent]='#2200ff'
    c[string]='#2c6732'
    c[const]='#ac4f23'
    c[type]='#643cae'
    c[preproc]='#95611f'
    c[special]='#1f4e94'
    c[error]='#ba2623'
    c[warn]='#b8802b'
    c[search]='#fae598'
    c[visual]='#e2ddf6' ;;
  linen)
    c[bg]='#fffcfc'
    c[fg]='#311317'
    c[muted]='#8c7a7c'
    c[linenr]='#b5a8aa'
    c[nontext]='#d2c9ca'
    c[hair]='#e6e0e1'
    c[line]='#f7f3f3'
    c[accent]='#9c3f22'
    c[string]='#2c6732'
    c[const]='#8a5a12'
    c[type]='#5b3a8c'
    c[preproc]='#7a5230'
    c[special]='#2c67c5'
    c[error]='#ba2623'
    c[warn]='#b8802b'
    c[search]='#fae598'
    c[visual]='#ece2d3' ;;
  white)
    c[bg]='#ffffff'
    c[fg]='#0d0d0d'
    c[muted]='#6e6e6e'
    c[linenr]='#a8a8a8'
    c[nontext]='#cacaca'
    c[hair]='#e2e2e2'
    c[line]='#f5f5f5'
    c[accent]='#2c67c5'
    c[string]='#2c6732'
    c[const]='#ac4f23'
    c[type]='#643cae'
    c[preproc]='#95611f'
    c[special]='#1f4e94'
    c[error]='#ba2623'
    c[warn]='#b8802b'
    c[search]='#fae598'
    c[visual]='#d1e5fd' ;;
  esac
  _clean=("${(@kv)c}")
}

# Hex colors need a truecolor terminal; otherwise map to the nearest 256 color
[[ $COLORTERM == (truecolor|24bit) ]] || zmodload zsh/nearcolor 2>/dev/null

_clean_rgb() { local h=${1#\#}; print -n "$((16#${h[1,2]}));$((16#${h[3,4]}));$((16#${h[5,6]}))" }

# ------------------------------------------------------------------ Prompt
# ~/projects/personal/dotfiles  main*
# ›                                              1 ↵   user@host
autoload -Uz vcs_info add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%F{$_clean[const]}*"
zstyle ':vcs_info:*' stagedstr "%F{$_clean[string]}+"
zstyle ':vcs_info:*' formats "  %F{$_clean[accent]}%b%u%c%f"
zstyle ':vcs_info:*' actionformats "  %F{$_clean[accent]}%b%f %F{$_clean[error]}%a%u%c%f"
add-zsh-hook precmd vcs_info

PROMPT=$'\n'"%B%F{$_clean[fg]}%~%f%b"'${vcs_info_msg_0_}'$'\n'"%(?.%F{$_clean[muted]}.%F{$_clean[error]})%(!.#.›)%f "
PROMPT2="%F{$_clean[muted]}… %f"
typeset -g _clean_venv="%F{$_clean[type]}"
RPROMPT="%(?..%F{$_clean[error]}%? ↵%f   )"'${VIRTUAL_ENV:+${_clean_venv}${VIRTUAL_ENV:t} }'"%F{$_clean[linenr]}%n@%m%f"
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ---------------------------------------------------------------- ls colors
# GNU ls (gls, Linux) and zsh completion read LS_COLORS; macOS ls reads LSCOLORS
export LS_COLORS="di=1;38;2;$(_clean_rgb $_clean[accent]):ln=38;2;$(_clean_rgb $_clean[type]):ex=38;2;$(_clean_rgb $_clean[string]):so=38;2;$(_clean_rgb $_clean[preproc]):pi=38;2;$(_clean_rgb $_clean[preproc]):bd=38;2;$(_clean_rgb $_clean[const]):cd=38;2;$(_clean_rgb $_clean[const]):or=38;2;$(_clean_rgb $_clean[error]):mi=38;2;$(_clean_rgb $_clean[error]):su=38;2;$(_clean_rgb $_clean[error]):sg=38;2;$(_clean_rgb $_clean[error]):tw=1;38;2;$(_clean_rgb $_clean[accent]):ow=1;38;2;$(_clean_rgb $_clean[accent])"
export CLICOLOR=1
export LSCOLORS=Exfxdxdxcxdadaeaeaeaea   # BSD ls only knows the 8 ANSI colors

# --------------------------------------------------------------- Completion
zmodload zsh/complist 2>/dev/null
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} "ma=48;2;$(_clean_rgb $_clean[visual]);38;2;$(_clean_rgb $_clean[fg])"
zstyle ':completion:*:descriptions' format "%F{$_clean[muted]}%d%f"
zstyle ':completion:*:warnings' format "%F{$_clean[error]}no matches%f"

# ------------------------------------------------------------- grep, less
export GREP_COLORS="ms=48;2;$(_clean_rgb $_clean[search]);38;2;$(_clean_rgb $_clean[fg]):mc=48;2;$(_clean_rgb $_clean[search]):fn=38;2;$(_clean_rgb $_clean[type]):ln=38;2;$(_clean_rgb $_clean[linenr]):se=38;2;$(_clean_rgb $_clean[nontext])"
# man pages: headings bold ink, emphasis in accent, status line like vim
export LESS_TERMCAP_md=$'\e[1;38;2;'"$(_clean_rgb $_clean[fg])m"
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;38;2;'"$(_clean_rgb $_clean[accent])m"
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_so=$'\e[48;2;'"$(_clean_rgb $_clean[fg]);38;2;$(_clean_rgb $_clean[bg])m"
export LESS_TERMCAP_se=$'\e[0m'

# ------------------------------------------------- zsh-syntax-highlighting
# Same rule as vim-clean: commands stay ink, only literals and mistakes get hue
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES+=(
  default                       "fg=$_clean[fg]"
  unknown-token                 "fg=$_clean[error]"
  reserved-word                 "fg=$_clean[fg],bold"
  alias                         "fg=$_clean[fg],bold"
  suffix-alias                  "fg=$_clean[fg],bold"
  builtin                       "fg=$_clean[fg],bold"
  function                      "fg=$_clean[fg],bold"
  command                       "fg=$_clean[fg],bold"
  precommand                    "fg=$_clean[fg],bold,underline"
  commandseparator              "fg=$_clean[muted]"
  path                          "fg=$_clean[fg],underline"
  globbing                      "fg=$_clean[special]"
  history-expansion             "fg=$_clean[special]"
  single-hyphen-option          "fg=$_clean[muted]"
  double-hyphen-option          "fg=$_clean[muted]"
  single-quoted-argument        "fg=$_clean[string]"
  double-quoted-argument        "fg=$_clean[string]"
  dollar-quoted-argument        "fg=$_clean[string]"
  back-quoted-argument          "fg=$_clean[special]"
  dollar-double-quoted-argument "fg=$_clean[const]"
  back-double-quoted-argument   "fg=$_clean[const]"
  assign                        "fg=$_clean[fg]"
  redirection                   "fg=$_clean[muted]"
  comment                       "fg=$_clean[muted],italic"
  arg0                          "fg=$_clean[fg],bold"
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$_clean[linenr]"

unfunction _clean_rgb
