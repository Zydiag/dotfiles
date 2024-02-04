#!/usr/bin/zsh

wall=$(find ~/Pictures/wall -name '*.png' -o -name '*.jpg'  | shuf -n 1)

echo $wall

feh --bg-fill $wall

