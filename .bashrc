#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.aliases ]] && . ~/.aliases

PS1='\u\e[0;35m@\e[m\h \e[0;34m\W\e[m > '

export PATH=${PATH}:`go env GOPATH`/bin
