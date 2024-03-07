#!/usr/bin/env bash

sleep 1

hyprctl --batch "dispatch workspace 2;dispatch workspace 3;dispatch workspace 4;dispatch workspace 5;"
hyprctl --batch "dispatch workspace 7;dispatch workspace 8;dispatch workspace 9;dispatch workspace 10;"

hyprctl dispatch workspace 6
hyprctl dispatch workspace 1
