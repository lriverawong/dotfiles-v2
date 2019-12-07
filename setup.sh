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
    
    # --- custom themes ---
    # -- pure zsh theme --
    # git clone https://github.com/sindresorhus/pure.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/pure
    

    # check for existence of zfunctions directory
    # if [ ! -d ~/.zfunctions ]; then
    #     mkdir ~/.zfunctions
    # fi

    # link
    # ln -s "$HOME/.oh-my-zsh/custom/themes/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
    # ln -s "$HOME/.oh-my-zsh/custom/themes/pure/async.zsh" "$HOME/.zfunctions/async"
    
fi

# setup starship
# spaceship prompt
zsh -c "git clone https://github.com/denysdovhan/spaceship-prompt.git \"$ZSH_CUSTOM/themes/spaceship-prompt\" && \
    ln -s \"$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme\" \"$ZSH_CUSTOM/themes/spaceship.zsh-theme\" "

# install kubectx
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# install helm
pushd /tmp
  sudo wget https://get.helm.sh/helm-v2.15.2-linux-amd64.tar.gz -P /tmp/
  sudo tar xvfz /tmp/helm-v2.15.2-linux-amd64.tar.gz
  sudo mkdir -p /opt/helm
  sudo mv /tmp/linux-amd64/helm /opt/helm
  sudo ln -sf /opt/helm/helm /usr/local/bin/helm
popd

# run stow setup
sh ./stow.sh

# -- Arch Installs --
if [[ type pacman &> /dev/null ]]; then
    # install packages
    sudo pacman -S --noconfirm - < ./packages/arch/pacman-pkglist.txt
    # install AUR packages
    yay -S --noconfirm - < ./packages/arch/aur-pkglist.txt
elif [[ type dnf &> /dev/null ]]; then
    # --- Fedora Install ---
    # fix hostname
    sudo hostnamectl set-hostname l-t480-f
    dnf install -y $(grep "^[^#]" ./packages/fedora/pkglist.txt)
    # enable tlp
    sudo systemctl enable tlp && sudo systemctl start tlp
    # multimedia
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
    sudo dnf groupupdate sound-and-video
    # google chrome
    sudo dnf config-manager --set-enabled google-chrome
    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager --set-enabled google-chrome
    sudo dnf check-update
    sudo dnf install google-chrome-stable
    # vscode
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf check-update
    sudo dnf install code
    # slack
    sudo dnf copr -y enable jdoss/slack-repo
    sudo dnf install -y slack-repo
    sudo dnf install -y slack
    # flatpak setup
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # spotify
    flatpak install -y flathub com.spotify.Client
    # teams-for-linux
    flatpak install -y flathub com.github.IsmaelMartinez.teams_for_linux
    # gcloud
    sudo sh -c 'echo -e "[google-cloud-sdk]\nname=Google Cloud SDK\nbaseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg\n\thttps://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" > /etc/yum.repos.d/google-cloud-sdk2.repo'
    # to-do
    # - fira-fonts
    # - keybase
    # - simplenote
    # - nordvpn
    # - openvpn-update-systemd-resolved
    # - keybase
    # - thefuck
    # - gesture [cli, and gui]

else
    echo "No valid distro found, exiting..."
    exit 1
fi

# add user to input group for touchpad gestures
sudo gpasswd -a $USER input

# setup helm
helm init --client-only
helm plugin install https://github.com/rimusz/helm-tiller
# needs sops installed from AUR
helm plugin install https://github.com/futuresimple/helm-secrets
helm plugin install https://github.com/hayorov/helm-gcs

# tfenv -> terraform 11 and 12
if [[ ! -d ~/.tfenv ]]; then
    git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
fi

$HOME/.tfenv/bin/tfenv install 0.11.14
$HOME/.tfenv/bin/tfenv install 0.12.12

# ssh-agent
systemctl --user daemon-reload
systemctl --user start ssh-agent.service
systemctl --user enable ssh-agent.service

# openvpn-update-systemd-resolved for vpn
sudo systemctl enable systemd-resolved.service
sudo systemctl start systemd-resolved.service

# install vscode extensions
cat ./vscode/.config/Code/User/code-extensions.txt | xargs -L1 code --install-extension

# tfenv
tfenv install 0.11.14
tfenv install 0.12.9

# done
echo "Done install script!"
