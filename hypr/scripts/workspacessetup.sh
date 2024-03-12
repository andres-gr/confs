#!/usr/bin/env bash

sleep 1

hyprctl --batch "dispatch workspace 2;dispatch workspace 3;dispatch workspace 4;dispatch workspace 5;"
hyprctl --batch "dispatch workspace 7;dispatch workspace 8;dispatch workspace 9;dispatch workspace 10;"

hyprctl dispatch workspace 6

sleep 0.2

hyprctl dispatch workspace 1

sleep 0.75

monitor1=$(wlr-randr | rg '^(HDMI-[^\s]+)' | awk '{print $1}')
monitor2=$(wlr-randr | rg '^(DP-[^\s]+)' | awk '{print $1}')

wal1=~/.config/swww/Dracula/dracula-pro.png
wal2=~/.config/swww/Dracula/mass-effect-normandy.jpg

swww img -t none -o $monitor1 $wal1
swww img -t none -o $monitor2 $wal2
