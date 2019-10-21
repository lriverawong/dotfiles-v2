#!/bin/zsh


# Checks for commands needed for setup script
progs=(git zsh stow unzip)
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
    chsh -s `which zsh` $USER

    # --- plugins ---
    # zsh syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # zsh history substring search
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    # spaceship prompt
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
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
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# install kubectx
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# install helm
pushd /tmp
  sudo wget https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz -P /tmp/
  sudo tar xvfz /tmp/helm-v2.14.3-linux-amd64.tar.gz
  sudo mkdir -p /opt/helm
  sudo mv /tmp/linux-amd64/helm /opt/helm
  sudo ln -sf /opt/helm/helm /usr/local/bin/helm
popd

# run stow setup
sh ./stow.sh

# install packages
sudo pacman -S --noconfirm - < ./packages/arch/pacman-pkglist.txt

# add user to input group for touchpad gestures
sudo gpasswd -a $USER input

# install AUR packages
yay -S --noconfirm - < ./packages/arch/aur-pkglist.txt

# setup helm
helm init --client-only
helm plugin install https://github.com/rimusz/helm-tiller
# needs sops installed from AUR
helm plugin install https://github.com/futuresimple/helm-secrets
helm plugin install https://github.com/hayorov/helm-gcs

# tfenv -> terraform 11 and 12
if [! -d ~/.tfenv]; then
    git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
fi
$HOME/.tfenv/bin/tfenv install 0.11.14
$HOME/.tfenv/bin/tfenv install 0.12.12

# ssh-agent
systemctl --user daemon-reload
systemctl --user start ssh-agent.service
systemctl --user enable ssh-agent.service

# install vscode extensions
cat ./vscode/.config/Code/User/code-extensions.txt | xargs -L1 code --install-extensionc

# tfenv
sudo tfenv install 0.11.14
sudo tfenv install 0.12.9

# done
echo "Done install script!"
