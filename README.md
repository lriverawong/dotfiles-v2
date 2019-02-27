# Luis Rivera-Wong Dotfiles

## Dependencies
- stow
- fzf
- feh
- rofi/dmenu
- playerctl
- i3-gaps

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
`stow -v *`

## Delete dotfiles
`stow -D <dirname>`

