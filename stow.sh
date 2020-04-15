#!/bin/sh

# needs `stow` package
# meant to only be run once

echo "=== Starting to link all dotfiles ==="

stow -v conky
stow -v docker
stow -v github-config
stow -v glances
stow -v konsole
stow -v libinput-gestures
stow -v neovim
stow -v ranger
stow -v scripts
stow -v ssh-agent
stow -v ssh-add
stow -v ssh-askpass
stow -v tmux
stow -v vscode
stow -v vim
if [ -f ~/.zshrc ];then
  mv ~/.zshrc ~/.zshrc.bak
fi
stow -v zsh

echo "=== Done linking all dotfiles ==="
