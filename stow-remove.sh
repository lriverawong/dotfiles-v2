#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -Dv bash
stow -Dv compton
stow -Dv conky
stow -Dv dunst
stow -Dv github-config
stow -Dv glances
stow -Dv i3
stow -Dv i3status
stow -Dv konsole
stow -Dv neovim
# stow -v plasma-i3-replace
stow -Dv profile
stow -Dv ranger
stow -Dv rofi
stow -Dv scripts
stow -Dv tmux
stow -Dv vim
stow -Dv X
stow -Dv zsh

echo "=== Done linking all dotfiles ==="
