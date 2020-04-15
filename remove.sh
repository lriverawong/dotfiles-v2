#!/bin/zsh

# undo stow links
sh ./stow-remove.sh

# delete oh-my-zsh dir
rm -rf $HOME/.oh-my-zsh

# ssh-agent
systemctl --user stop ssh-agent.service
systemctl --user disable ssh-agent.service

# vpn access
# sudo systemctl stop systemd-resolved.service
# sudo systemctl disable systemd-resolved.service

# vscode extensions
cat ./vscode/.config/Code/User/code-extensions.txt | xargs -L1 code --uninstall-extension

# done
echo "Done removal!"
