#!/bin/sh

# needs `stow` package

echo "=== Starting to link all dotfiles ==="

stow -v conky
stow -v docker
stow -v github-config
stow -v glances
stow -v konsole
stow -v libinput-gestures
stow -v neovim
stow -v profile
stow -v ranger
stow -v scripts
stow -v ssh-agent
stow -v ssh-add
stow -v ssh-askpass
stow -v tmux
stow -v vscode
stow -v vim
if [ -f ~/.xinitrc ];then
  mv ~/.xinitrc ~/.xinitrc.bak
fi
if [ -f ~/.profile ];then
  mv ~/.profile ~/.profile.bak
fi
stow -v X
if [ -f ~/.zshrc ];then
  mv ~/.zshrc ~/.zshrc.bak
fi
stow -v zsh

echo "=== Done linking all dotfiles ==="
