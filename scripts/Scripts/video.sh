#!/bin/bash
internal=eDP1
ecobee=DP1

# triple-monitor-setup
if xrandr | grep "$ecobee connected"; then
    xrandr --output eDP1 --mode 1600x900 --pos 0x559 --rotate normal --output DP1 --primary --mode 2560x1440 --pos 1600x289 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 4160x0 --rotate right --output VIRTUAL1 --off
else
    # Solo laptop monitor
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x559 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
fi
