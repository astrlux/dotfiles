#!/bin/sh

stow bash
stow xorg
stow local
stow suckless
stow nvim
stow kitty
stow -t /etc etc # symlink to `/etc` dir
