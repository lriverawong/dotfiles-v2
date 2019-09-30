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
sudo rm /usr/local/bin/terraform*
sudo rm -rf /opt/terraform*

# delete helm
sudo rm /usr/local/bin/helm
sudo rm -rf /opt/helm
rm -rf ~/.helm

# ssh-agent
systemctl --user stop ssh-agent.service
systemctl --user disable ssh-agent.service

# vscode extensions
cat ./vscode/.config/Code/User/code-extensions.txt | xargs -L1 code --uninstall-extension

# done
echo "Done removal!"