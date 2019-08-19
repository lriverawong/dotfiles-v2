#!/bin/bash
internal=eDP1
ecobee=DP1

# triple-monitor-setup
if xrandr | grep -w "$ecobee connected"; then
    xrandr --output eDP1 --mode 1600x900 --pos 0x904 --rotate normal --output DP1 --primary --mode 2560x1440 --pos 1600x364 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 4160x0 --rotate right --output VIRTUAL1 --off
    i3-msg "workspace 1, move workspace to output DP1"
    i3-msg "workspace 2, move workspace to output DP1"
    i3-msg "workspace 3, move workspace to output DP1"
    i3-msg "workspace 4, move workspace to output DP1"
    i3-msg "workspace 5, move workspace to output HDMI2"
    i3-msg "workspace 6, move workspace to output HDMI2"
    i3-msg "workspace 7, move workspace to output HDMI2"
    i3-msg "workspace 8, move workspace to output eDP1"
    i3-msg "workspace 1"
    notify-send -t 1000 "Triple Monitor Setup Applied"
    exec nitrogen --restore; sleep 1; compton -b;
elif xrandr | grep -w "$ecobee disconnected"  && xrandr | grep -w "HDMI2 connected"; then
    xrandr --output eDP1 --mode 1600x900 --pos 0x90 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 1920x1080 --pos 1600x0 --rotate normal --output VIRTUAL1 --off
    i3-msg "workspace 1, move workspace to output HDMI2"
    i3-msg "workspace 2, move workspace to output HDMI2"
    i3-msg "workspace 3, move workspace to output HDMI2"
    i3-msg "workspace 4, move workspace to output HDMI2"
    i3-msg "workspace 5, move workspace to output HDMI2"
    i3-msg "workspace 6, move workspace to output HDMI2"
    i3-msg "workspace 7, move workspace to output HDMI2"
    i3-msg "workspace 8, move workspace to output eDP1"
    i3-msg "workspace 1"
    notify-send -t 1000 "Dual Monitor Setup Applied"
    exec nitrogen --restore; sleep 1; compton -b;
else
    # Solo laptop monitor
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x559 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
    i3-msg "workspace 1, move workspace to output eDP1"
    i3-msg "workspace 2, move workspace to output eDP1"
    i3-msg "workspace 3, move workspace to output eDP1"
    i3-msg "workspace 4, move workspace to output eDP1"
    i3-msg "workspace 5, move workspace to output eDP1"
    i3-msg "workspace 6, move workspace to output eDP1"
    i3-msg "workspace 7, move workspace to output eDP1"
    i3-msg "workspace 8, move workspace to output eDP1"
    i3-msg "workspace 1"
    notify-send -t 1000 "Single Monitor Setup Applied"
    exec nitrogen --restore; sleep 1; compton -b;
fi