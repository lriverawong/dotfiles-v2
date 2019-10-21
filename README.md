# Luis Rivera-Wong Dotfiles

Manjaro KDE

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
yay -S - < packages/arch/aur-pkglist.txt
```

## Hibernation - Manjaro
- Check kernel version
  ```sh
  uname -r
  ```
- Make sure it matches
  ```sh
  /etc/mkinitcpio.d/<kernel-version>
  ```
- Make sure the `resume` hook is after the `udev` hook in `/etc/mkinitcpio.conf` and if not then add it in
  ```
  HOOKS="base udev autodetect modconf block keyboard keymap resume filesystems"
  ```
- Regenerate initramfs for the current kernel version (must be redone every major kernel update)
  ```sh
  sudo mkinitcpio -p linux<kernelversion>
  ```
 ## Todo
 - `gcloud init` and project setup
 - tfenv setup
- copy KDE/Plasma settings into part of the config
    - creating a backup of the local configs for kde
    - linking through stow? the configs for KDE/Plasma