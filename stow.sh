#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -v conky
stow -v compton
stow -v github-config
stow -v glances
stow -v konsole
stow -v libinput-gestures
stow -v neovim
stow -v profile
stow -v ranger
stow -v scripts
stow -v tmux
stow -v vim
stow -v X
stow -v zsh

echo "=== Done linking all dotfiles ==="
