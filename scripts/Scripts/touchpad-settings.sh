#!/bin/bash
# Based on: https://medium.com/@tim_888/lenovo-thinkpad-t480-ubuntu-18-04-install-log-linux-tweaks-379b96151372
# this is run by kde/gnome/xfce 'startup apps and scripts'
# xinput --list-props 12

touchpad="Synaptics TM3276-022"
xinput --set-prop "$touchpad" "libinput Accel Speed" 0
xinput --set-prop "$touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "$touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "$touchpad" "libinput Disable While Typing Enabled" 1
notify-send -t 1000 "$touchpad settings applied"

trackpoint="TPPS/2 IBM TrackPoint"
xinput --set-prop "$trackpoint" "libinput Natural Scrolling Enabled" 0
xinput --set-prop "$trackpoint" "libinput Accel Speed" 1
xinput --set-prop "$trackpoint" "libinput Accel Profile Enabled" 0 1
notify-send -t 1000 "$trackpoint settings applied"
