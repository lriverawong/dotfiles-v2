#!/bin/bash

# Checks for commands needed for setup script
progs=(git zsh stow)
for p in "${progs[@]}"; do
    if hash "$p" &>/dev/null
    then
        echo "$p is installed"
    else
        echo "$p is not installed, please install $p"
        exit 1
    fi
done


# Setup for arch based systems
if [ ! -d ~/.oh-my-zsh ]; then

    # install oh-my-zsh separately
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    # change default shell
    chsh -s `which zsh` luis

    # --- plugins ---
    # zsh syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # zsh history substring search
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

    # --- custom themes ---
    # -- pure zsh theme --
    git clone https://github.com/sindresorhus/pure.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/pure
    # check for existence of zfunctions directory
    if [ ! -d ~/.zfunctions ]; then
        mkdir ~/.zfunctions
    fi

    # link
    ln -s "$HOME/.oh-my-zsh/custom/themes/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
    ln -s "$HOME/.oh-my-zsh/custom/themes/pure/async.zsh" "$HOME/.zfunctions/async"
fi

bash ./stow.sh

systemctl --user daemon-reload
systemctl --user start ssh-agent.service
systemctl --user enable ssh-agent.service

# done
echo 'Done setup!'
