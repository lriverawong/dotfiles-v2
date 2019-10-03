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

