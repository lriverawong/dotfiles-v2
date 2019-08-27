#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -Dv conky
stow -Dv github-config
stow -Dv glances
stow -Dv konsole
stow -Dv libinput-gestures
stow -Dv neovim
stow -Dv profile
stow -Dv ranger
stow -Dv scripts
stow -Dv tmux
stow -Dv vim
stow -Dv X
stow -Dv zshsh

echo "=== Done linking all dotfiles ==="
