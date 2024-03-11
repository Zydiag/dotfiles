#!/usr/bin/sh
# export wall=$(find ~/Pictures/wall -name '*.png' -o -name '*.jpg'  | shuf -n 1)
#
# echo $wall
#
# feh --bg-fill $wall
#
#     gsettings set org.gnome.desktop.background picture-uri "${wall}"
#     # wal -i "${wall}"
#     # index is maxing out, so reset it
#     # if [ $(($index+1)) -eq $wallpapers_size ]
#     # then
#     #     index=0
#     # else
#     #     index=$(($index + 1))
#     # fi
#     # keep the wallpaper for the specified time
#     sleep 60m
#
#!/bin/bash

# script to set random background wallpapers on my GNOME desktop
# set base path
export wallpaper_path=$HOME/Pictures/wall
shopt -s nullglob

shuffle() {
    local i tmp size max rand
   size=${#wallpapers[*]}
   max=$(( 32768 / size * size ))

   for ((i=size-1; i>0; i--)); do
       while (( (rand=$RANDOM) >= max )); do :; done
       rand=$(( rand % (i+1) ))
       tmp=${wallpapers[i]} wallpapers[i]=${wallpapers[rand]} wallpapers[rand]=$tmp
   done
}

# store all the image file names in wallpapers array
wallpapers=(
    "$wallpaper_path"/*.jpg
    "$wallpaper_path"/*.jpeg
    "$wallpaper_path"/*.png
    "$wallpaper_path"/*.bmp
    "$wallpaper_path"/*.svg
)
# get array length
wallpapers_size=${#wallpapers[*]}

# randomly shuffle the wallpapers at start up
shuffle

# set wallpapers in incremental order
index=0
echo ${wallpapers}
while [ $index -lt $wallpapers_size ]
do
    gsettings set org.gnome.desktop.background picture-uri "${wallpapers[$index]}"
     # wal -i "${wallpapers[$index]}"
    # index is maxing out, so reset it
    if [ $(($index+1)) -eq $wallpapers_size ]
    then
        index=0
    else
        index=$(($index + 1))
    fi
    # keep the wallpaper for the specified time
    sleep 60m
done
