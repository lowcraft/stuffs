#!/bin/bash

# script: rndwp.sh
# name: Random Wallpapers
# description: Change randomly wallpaper on Gnome Desktop
# author: boa <boa@weboa.org>
# date: 2024/11/10
# version: 0.2
# bugs: 
# 2	no check of the current wallpaper used 
# fixed:
# 1	sometime, black screen appear, must fix it!
#	change random init number
# mod:
# 3	change (temporary) Gnome notification

_path=$HOME/Images/Wallpapers
_files=( $(ls $_path | sort -R) )
_max=${#_files[@]}
_random=$((0 + RANDOM % $_max))
_image=${_files[_random]}
_tmp=`gsettings get org.gnome.desktop.background picture-uri | tr -d "'"`
_current=`basename $_tmp`

gsettings set org.gnome.desktop.background picture-uri "file://$_path/$_image"
# notify-send "Change wallpaper to ${_image}" -a "Wallpaper Randomize Change" -t 200 -w # 3
