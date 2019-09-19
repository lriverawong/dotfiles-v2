#!/bin/zsh

# undo stow links
sh ./stow-remove.sh

# delete .zfunctions
rm -rf $HOME/.zfunctions

# delete oh-my-zsh dir
rm -rf $HOME/.oh-my-zsh

# remove ssh agent
systemctl --user disable ssh-agent.service
systemctl --user stop ssh-agent.service

# done
echo "Done removal script!"
