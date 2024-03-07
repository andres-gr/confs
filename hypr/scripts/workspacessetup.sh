#!/usr/bin/env bash

sleep 1

hyprctl --batch "dispatch silent workspace 2;dispatch silent workspace 3;dispatch silent workspace 4;dispatch silent workspace 5;"
hyprctl --batch "dispatch silent workspace 7;dispatch silent workspace 8;dispatch silent workspace 9;dispatch silent workspace 10;"
