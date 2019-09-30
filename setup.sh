#!/bin/zsh

# Setup for arch based systems
if [ ! -d ~/.oh-my-zsh ]; then
    # add zsh
    sudo pacman -S zsh --noconfirm
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

# install kubectx
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# install terraform v.0.11.14
pushd /tmp
  sudo wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip -P /tmp/
  sudo unzip /tmp/terraform_0.11.14_linux_amd64.zip
  sudo mv /tmp/terraform /tmp/terraform11
  sudo mkdir -p /opt/terraform11
  sudo mv /tmp/terraform11 /opt/terraform11/
  sudo ln -sf /opt/terraform11/terraform11 /usr/local/bin/terraform11
popd

# install terraform v.0.12.9
pushd /tmp
  sudo wget https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip -P /tmp/
  sudo unzip /tmp/terraform_0.12.9_linux_amd64.zip
  sudo mv /tmp/terraform /tmp/terraform12
  sudo mkdir -p /opt/terraform12
  sudo mv /tmp/terraform12 /opt/terraform12/
  sudo ln -sf /opt/terraform12/terraform12 /usr/local/bin/terraform12
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
sh ./stow.sh

# install packages
sudo pacman -S --noconfirm - < ./packages/arch/pacman-pkglist.txt

# add user to input group for touchpad gestures
sudo gpasswd -a $USER input

# install AUR packages
yay -S --noconfirm - < ./packages/arch/aur-pkglist.txt

# ssh-agent
systemctl --user daemon-reload
systemctl --user start ssh-agent.service
systemctl --user enable ssh-agent.service

# install vscode extensions
cat ./vscode/.config/Code/User/code-extensions.txt | xargs -L1 code --install-extension

# done
echo "Done removal script!"