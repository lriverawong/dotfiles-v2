#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -v bash
stow -v compton
stow -v github-config
stow -v glances
stow -v i3
stow -v konsole
stow -v neovim
# stow -v plasma-i3-replace
stow -v profile
stow -v ranger
stow -v tmux
stow -v vim
stow -v X
stow -v zsh

echo "=== Done linking all dotfiles ==="
