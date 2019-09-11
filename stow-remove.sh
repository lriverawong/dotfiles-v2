#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -Dv conky
stow -Dv docker
stow -Dv github-config
stow -Dv glances
stow -Dv konsole
stow -Dv libinput-gestures
stow -Dv neovim
stow -Dv profile
stow -Dv ranger
stow -Dv scripts
stow -Dv ssh-agent
stow -Dv ssh-add
stow -Dv ssh-askpass
stow -Dv tmux
stow -Dv vim
stow -Dv X
stow -Dv zshsh

echo "=== Done linking all dotfiles ==="
