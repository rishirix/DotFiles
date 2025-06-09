#!/bin/bash
hyprctl hyprpaper reload , $1

echo "preload=$HOME/$1
wallpaper= ,$HOME/$1" > $HOME/.config/hypr/hyprpaper.conf
