# Luis Rivera-Wong Dotfiles

## Dependencies
- stow
- fzf
- feh
- rofi/dmenu
- playerctl
- i3-gaps
- exuberant-ctags
- xcape

## Dotfiles
All files are relative to home

- ~/.config/nvim/
- zsh config
- i3 config
- compton config
- plasma workspace for i3 wm replacement
- .profile
- base vimrc
- remap script for caps lock to escape key (in i3 config but actual script in ~/Scripts linked to ~/bin)

## Insert dotfiles
`sh stow.sh`

## Delete dotfiles
`stow -D <dirname>`

## prezto
- https://github.com/sorin-ionescu/prezto/
```
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
```
