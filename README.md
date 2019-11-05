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
    - linking through stow? the configs for kde/plasma
- gopass config
- global emoji font support (KDE)
- `libinput-gestures-setup autostart`

## Work VPN Access
- need the following package [openvpn-update-systemd-resolved](https://github.com/jonathanio/update-systemd-resolved)
```
yay -S openvpn-update-systemd-resolved
sudo systemctl enable systemd-resolved.service
sudo systemctl start systemd-resolved.service
```

Update your work vpn configuration file to include the following, replacing as needed
```
script-security 2
setenv PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
up /etc/openvpn/scripts/update-systemd-resolved
up-restart
down /etc/openvpn/scripts/update-systemd-resolved
down-pre
```

Start the vpn connection using the command line or the script in `scripts/*`
```
sudo openvpn --config ~/.vpn/<work>.ovpn --auth-retry interact --auth-user-pass
```

## Fonts
- follow the [guide](https://www.reddit.com/r/archlinux/comments/9q8dlj/how_to_better_enable_color_emojis/)
  - `sudo pacman -S noto-fonts-emoji`, although it should already be installed through `setup.sh`
  - Create a `75-noto-color-emoji.conf` file in `/etc/fonts/conf.avail/` with the following:
	```
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
	<fontconfig>

	    <!-- Add generic family. -->
	    <match target="pattern">
	        <test qual="any" name="family"><string>emoji</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <!-- This adds Noto Color Emoji as a final fallback font for the default font families. -->
	    <match target="pattern">
	        <test name="family"><string>sans</string></test>
	        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test name="family"><string>serif</string></test>
	        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test name="family"><string>sans-serif</string></test>
	        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test name="family"><string>monospace</string></test>
	        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
	    </match>

	    <!-- Block Symbola from the list of fallback fonts. -->
	    <selectfont>
	        <rejectfont>
	            <pattern>
	                <patelt name="family">
	                    <string>Symbola</string>
	                </patelt>
	            </pattern>
	        </rejectfont>
	    </selectfont>

	    <!-- Use Noto Color Emoji when other popular fonts are being specifically requested. -->
	    <match target="pattern">
	        <test qual="any" name="family"><string>Apple Color Emoji</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Segoe UI Emoji</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Segoe UI Symbol</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Android Emoji</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Twitter Color Emoji</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Twemoji</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Twemoji Mozilla</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>TwemojiMozilla</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>EmojiTwo</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Emoji Two</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>EmojiSymbols</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	    <match target="pattern">
	        <test qual="any" name="family"><string>Symbola</string></test>
	        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
	    </match>

	</fontconfig>
	```
  - `sudo ln -sf /etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/`
  - Test with the following site `https://eosrei.github.io/emojione-color-font/full-demo.html`

