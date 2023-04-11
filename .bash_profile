#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Append ~/.local/bin to PATH
PATH=$PATH:$HOME/.local/bin

# Autorun startx
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    . startx
    logout
fi
