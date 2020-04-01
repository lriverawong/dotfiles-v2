#!/bin/bash

echo "Looking for pair option 3 on Mx Master 3"
mac_address="F5:3D:A8:1B:C5:BE"

echo $mac_address

bluetoothctl -- power on
bluetoothctl -- scan on
bluetoothctl -- info $mac_address
bluetoothctl -- pair $mac_address
bluetoothctl -- connect $mac_address

