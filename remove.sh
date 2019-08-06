#!/bin/zsh

# undo stow links
sh ./stow-remove.sh

# delete .zfunctions
rm -rf $HOME/.zfunctions

# delete oh-my-zsh dir
rm -rf $HOME/.oh-my-zsh

# delete link for kubectx
sudo rm /usr/bin/kubectx
sudo rm /usr/bin/kubens
sudo rm -rf /opt/kubectx/

# delete terraform
sudo rm /usr/local/bin/terraform
sudo rm -rf /opt/terraform

# delete helm
sudo rm /usr/local/bin/helm
sudo rm -rf /opt/helm
rm -rf ~/.helm