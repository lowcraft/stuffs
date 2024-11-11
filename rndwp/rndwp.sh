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

_history=0 # number of historical images to ignore (not yet implented)
_path=$HOME/Images/Wallpapers # The wallpaper folder
_files=( $(ls $_path | sort -R) ) # Get the list of files sorted randomly
_max=${#_files[@]} # Get the number of files
_random=$((0 + RANDOM % $_max)) # Get random number
_image=${_files[_random]} # Get a random image
_tmp=`gsettings get org.gnome.desktop.background picture-uri | tr -d "'"` # Get the current wallpaper image before change (futur release)
_current=`basename $_tmp` # Get only the filename (futur release)

gsettings set org.gnome.desktop.background picture-uri "file://$_path/$_image"
# notify-send "Change wallpaper to ${_image}" -a "Wallpaper Randomize Change" -t 200 -w # 3
