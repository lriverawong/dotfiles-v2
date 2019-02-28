#!/bin/sh
# Source: https://github.com/LukeSmithxyz/voidrice/blob/master/.scripts/tools/remaps
# This script is called by i3 on startup to remap keys.
# Increase key speed via a rate change
xset r rate 300 50
# Map the caps lock key to super...
setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'