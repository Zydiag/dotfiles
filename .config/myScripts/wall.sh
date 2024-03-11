#!/bin/sh

# Set the path to the wallpaper
export wall=$(find ~/Pictures/wall -name '*.png' -o -name '*.jpg' | shuf -n 1)


# Set the wallpaper using wal
# feh --bg-fill $wall
wal -q -i "$wall"

# Set the GNOME desktop background
gsettings set org.gnome.desktop.background picture-uri "file://$wall"

