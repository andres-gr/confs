#!/usr/bin/env bash

# swww img -t fade -o HDMI-A-1 --transition-duration=0.25 $HOME/.config/swww/Dracula/dracula\ pro.png

monitor1=$(wlr-randr | rg '^(HDMI-[^\s]+)' | awk '{print $1}')
monitor2=$(wlr-randr | rg '^(DP-[^\s]+)' | awk '{print $1}')

walls=(
  $HOME/.config/swww/Dracula/mass-effect-normandy.jpg
  $HOME/.config/swww/Dracula/navi.jpg
  $HOME/.config/swww/Dracula/rocket-league-octane.jpg
  $HOME/.config/swww/Dracula/unitology.jpg
  $HOME/.config/swww/Dracula/cyberpunk-2077-samurai-logo.jpg
  $HOME/.config/swww/Dracula/dracula-pro.png
  $HOME/.config/swww/Dracula/metroid.jpg
  $HOME/.config/swww/Dracula/batman-eyeshadow.jpg
  $HOME/.config/swww/Dracula/witcher-3-minimal.jpg
  $HOME/.config/swww/Dracula/missingno.jpg
)

monitor=''

wall=$(hyprctl activeworkspace | rg 'ID [0-9]' | awk '{print $3}')

if [[ $wall -lt 6 ]]; then
  monitor=$monitor2
else
  monitor=$monitor1
fi

swww img -t fade -o $monitor --transition-duration=0.25 ${walls[$wall - 1]}
