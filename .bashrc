#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.aliases ]] && . ~/.aliases

PS1='\u\e[0;35m@\e[m\h \e[0;34m\W\e[m > '

BROWSER=firefox

# Append ~/.local/bin to PATH
PATH="${PATH:+${PATH}:}${HOME}/.local/bin"
