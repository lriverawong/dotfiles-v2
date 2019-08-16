# Luis Rivera-Wong Dotfiles

## Dependencies
- Manjaro i3 (it's provided tools, which I will list later)
    - URxvt
    - conky
    - compton
    - i3-gaps
    - demnu
    - dunst
    - xorg-xbacklight
- stow
- rofi
- playerctl
- keychain

## Dotfiles
All files are relative to home

Note
- remap script for caps lock to escape key (in i3 config but actual script in ~/Scripts linked to ~/bin)

## Insert dotfiles
`sh stow.sh`

## Delete dotfiles
`stow -D <dirname>`

## Complete setup
`sh setup.sh`

## Complete removal
`sh remove.sh`

## To-DO

- ssh-agent autostart
