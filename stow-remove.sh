#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -Dv compton
stow -Dv github-config
# stow -v i3
stow -Dv konsole
stow -Dv neovim
# stow -v plasma-i3-replace
stow -Dv profile
stow -Dv ranger
stow -Dv vim
#stow -v X
stow -Dv zsh

echo "=== Done linking all dotfiles ==="
