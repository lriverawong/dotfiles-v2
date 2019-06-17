#!/bin/zsh

# Setup for ubuntu
# Still need to fix setup process for Arch based distros

# install needed fonts
## clone
git clone https://github.com/powerline/fonts.git --depth=1
## install
cd fonts
./install.sh
## clean-up a bit
cd ..
rm -rf fonts

# install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# link to zprezto files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# mv the default configs
mv "${ZDOTDIR:-$HOME}"/.zprezto/runcoms "${ZDOTDIR:-$HOME}"/.zprezto/runcoms.default


# run stow setup
sh ./stow.sh
