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

# install terraform v.0.11.14
pushd /tmp
  sudo wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip -P /tmp/
  sudo unzip /tmp/terraform_0.11.14_linux_amd64.zip
  sudo mkdir -p /opt/terraform
  sudo mv /tmp/terraform /opt/terraform/
  sudo ln -sf /opt/terraform/terraform /usr/local/bin/terraform
popd

# install helm
pushd /tmp
  sudo wget https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz -P /tmp/
  sudo tar xvfz /tmp/helm-v2.14.3-linux-amd64.tar.gz
  sudo mkdir -p /opt/helm
  sudo mv /tmp/linux-amd64/helm /opt/helm
  sudo ln -sf /opt/helm/helm /usr/local/bin/helm
popd
# setup helm
helm init --client-only
helm plugin install https://github.com/rimusz/helm-tiller

# run stow setup
sudo pacman -S stow --noconfirm
sh ./stow.sh

# install packages
sudo pacman -S --noconfirm - < ./packages/arch/pacman-pkglist.txt

# add user to input group for touchpad gestures
sudo gpasswd -a $USER input

# add user to docker group
sudo gpasswd -a $USER docker

# install AUR packages
yay -S --noconfirm - < ./packages/arch/aur-pkglist.txt

# start ssh-agent
systemctl --user start ssh-agent.service
systemctl --user enable ssh-agent.service

# vscode extensions
cat ./vscode/.config/Code/User/code-extensions.txt | xargs -L1 code --install-extension

# done
echo 'Done setup!'
