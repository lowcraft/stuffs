#!/bin/bash

# script: rndwp.sh
# name: Random Wallpapers
# description: Change randomly wallpaper on Gnome Desktop
# author: boa <boa@weboa.org>
# date: 2024/11/10
# version: 0.1
# bugs: 
# 1	sometime, black screen appear, must fix it!
# 2	no check of the current wallpaper used 

_path=$HOME/Images/Wallpapers
_files=( $(ls $_path | sort -R) )
_max=${#_files[@]}
_random=$((1 + RANDOM % $_max))
_image=${_files[_random]}

gsettings set org.gnome.desktop.background picture-uri "file://$_path/$_image"
notify-send "Change wallpaper to ${_image}" -a "Wallpaper Randomize Change" -t 200 -w
