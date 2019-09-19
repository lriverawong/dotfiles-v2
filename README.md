# Luis Rivera-Wong Dotfiles

Manjaro KDE - Workstation

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
## KDE Keymaps
- KWin
    - Go to the `Global Shorcuts` application and import `./kde-shortcuts/kwin-global-shortcuts` 
- Custom Shortcuts Group
    - Go to the `Custom Shortcuts` application and import `./kde-shortcuts/custom-shortcuts`

## SSH-Agent
Check the status after install
```
systemctl --user status ssh-agent.service
```

## Future plans
- make master branch just for base main (kde) configs and then make `ecobee-kde` and `personal-kde` branches and all other following branches to rebase from master
