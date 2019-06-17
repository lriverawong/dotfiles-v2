#!/bin/zsh

# only setup for ubuntu
# still need to fix for arch based distros

# remove link to zprezto files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# remove prezto
rm -rf "${ZDOTDIR:-$HOME}"/.zprezto/

# undo stow links
sh ./stow-remove.sh

# remove powerline fonts
## clone
git clone https://github.com/powerline/fonts.git --depth=1
## install
cd fonts
chmod +x uninstall.sh
./uninstall.sh
## clean-up a bit
cd ..
rm -rf fonts
