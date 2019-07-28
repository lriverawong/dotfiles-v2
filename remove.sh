#!/bin/zsh

# only setup for ubuntu

# undo stow links
sh ./stow-remove.sh

# delete .zfunctions
rm -rf ~/.zfunctions

# delete oh-my-zsh dir
rm -rf ~/.oh-my-zsh