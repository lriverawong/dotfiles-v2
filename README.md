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


## Complete setup
`sh setup.sh`

## Complete removal
`sh remove.sh`

## Package Install
```
sudo pacman -S - < packages/arch/pacman-pkglist.txt
```
```
sudo yay -S - < packages/arch/aur-pkglist.txt
```
```
