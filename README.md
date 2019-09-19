# Luis Rivera-Wong Dotfiles

This is the base configuration that all other branches will be rebasing from.

## Dependencies
- stow
- xcape

## Dotfiles
All files are relative to home

## Insert dotfiles
`sh stow.sh`

## Delete dotfiles
`stow -D <dirname>`


## Complete setup
`sh setup.sh`

## Complete removal
`sh remove.sh`

## Package Install
### Arch/Manjaro
```
sudo pacman -S - < packages/arch/pacman-pkglist.txt
```
```
yay -S - < packages/arch/aur-pkglist.txt
```