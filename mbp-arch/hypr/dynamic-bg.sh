#!/bin/sh
cd ~/Pictures/wallpapers/
hyprpaper & disown

CURR_WP=$(find anime/ -type f | shuf -n1)
hyprctl hyprpaper preload $CURR_WP
sleep 1
hyprctl hyprpaper wallpaper eDP-1,$CURR_WP

while true; do
    sleep 4
    # preload new wallpaper
    PREV_WP=$CURR_WP
    CURR_WP=$(find anime/ -type f | shuf -n1)
    hyprctl hyprpaper preload $CURR_WP
    sleep 1
    hyprctl hyprpaper wallpaper eDP-1,$CURR_WP
    sleep 1
    hyprctl hyprpaper unload $PREV_WP
done

