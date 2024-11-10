#!/bin/bash

# author: boa <boa@weboa.org>
# date: 2024/11/10
# version: 0.1

_path=$HOME/Images/Wallpapers
_files=( $(ls $_path | sort -R) )
_max=${#_files[@]}
_random=$((1 + RANDOM % $_max))
_image=${_files[_random]}

gsettings set org.gnome.desktop.background picture-uri "file://$_path/$_image"
notify-send "Change wallpaper to ${_image}" -a "Wallpaper Randomize Change" -t 200 -w
