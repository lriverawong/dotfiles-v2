#!/bin/bash
# Based on: https://medium.com/@tim_888/lenovo-thinkpad-t480-ubuntu-18-04-install-log-linux-tweaks-379b96151372
# this is run by kde/gnome/xfce 'startup apps and scripts'
# xinput --list-props 12
touchpad_driver=$(grep DRIVER /sys/class/input/mouse0/device/device/uevent | sed 's/DRIVER=//g')
synaptic_touchpad="Synaptics"
touchpad_id=$(xinput --list | grep -iE "(Touchpad|$touchpad_driver|$synaptic_touchpad)" | xargs -n 1 | grep "id=" | sed 's/id=//g')
accel_speed_code=$(xinput --list-props "$touchpad_id" | awk '/Accel Speed \(/ {print $4}' | grep -o '[0-9]\+')
current_speed=$(xinput --list-props "$touchpad_id" | awk '/Accel Speed \(/ {print $5}')
speed=0.75

touchpad="Synaptics TM3276-022"
xinput --set-prop "$touchpad_id" "$accel_speed_code" "$speed"
# xinput --set-prop "$touchpad" "libinput Accel Speed" 0
xinput --set-prop "$touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "$touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "$touchpad" "libinput Disable While Typing Enabled" 1
notify-send -t 1500 "$touchpad settings applied"

trackpoint="TPPS/2 IBM TrackPoint"
xinput --set-prop "$trackpoint" "libinput Natural Scrolling Enabled" 0
xinput --set-prop "$trackpoint" "libinput Accel Speed" 1
xinput --set-prop "$trackpoint" "libinput Accel Profile Enabled" 0 1
notify-send -t 1500 "$trackpoint settings applied"
