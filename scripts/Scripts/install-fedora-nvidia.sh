#!/bin/bash
# Fedora 30
# instal rpm fusion - free & nonfree
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# check video card
/sbin/lspci | grep -e VGA
# install nvidia-latest-driver
sudo dnf install xorg-x11-drv-nvidia akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
sudo dnf update -y
# check currently using video drivers
lspci -nnk
