#!/bin/bash

# bash_aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # List dir contents aliases
    # ref: http://ss64.com/osx/ls.html
    alias ls="ls -G"
    # Long form no user group, color
    alias l="ls -oG"
    # Order by last modified, long form no user group, color
    alias lt="ls -toG"
    # List all except . and ..., color, mark file types, long form no user group, file size
    alias la="ls -AGFoh"
    # List all except . and ..., color, mark file types, long form no use group, order by last modified, file size
    alias lat="ls -AGFoth"
fi

# Open file in exisiting MacVim window
alias mvim="open -a MacVim"
alias vim="nvim"
