#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -v docker
stow -v github-config
stow -v glances
stow -v konsole
stow -v libinput-gestures
stow -v neovim
stow -v scripts
stow -v ssh-agent
stow -v tmux
stow -v vim
stow -v zsh

echo "=== Done linking all dotfiles ==="
