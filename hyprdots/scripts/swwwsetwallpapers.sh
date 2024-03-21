#!/usr/bin/env bash

sleep 0.5

monitor1=$(wlr-randr | rg '^(HDMI-[^\s]+)' | awk '{print $1}')
monitor2=$(wlr-randr | rg '^(DP-[^\s]+)' | awk '{print $1}')

wal1=~/.config/swww/Dracula/dracula-pro.png
wal2=~/.config/swww/Dracula/mass-effect-normandy.jpg

swww img -t none -o $monitor1 $wal1
swww img -t none -o $monitor2 $wal2
