#!/usr/bin/env bash

Hyprdots_path=$HOME/Hyprdots/Configs/.config
config_path=$HOME/.config

# check if .config directory exists
if [ ! -d $config_path ]; then
  mkdir $config_path
fi

# backup dunst conf and replace with symlink
if [ -d $config_path/dunst ]; then
  if [ ! -f $config_path/dunst/dunst.conf.bak ]; then
    mv -f $config_path/dunst/dunst.conf $config_path/dunst/dunst.conf.bak
  fi

  rm -rf $config_path/dunst/dunst.conf
  cp -rf $PWD/dunst/dunst.conf $config_path/dunst/dunst.conf
fi

# [ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# backup monitors conf and replace with symlink
if [ -f /etc/X11/xorg.conf.d/09-monitors.conf ]; then
  sudo mv -f /etc/X11/xorg.conf.d/09-monitors.conf /etc/X11/xorg.conf.d/09-monitors.conf.bak
fi

sudo rm -rf /etc/X11/xorg.conf.d/09-monitors.conf
sudo cp -f $PWD/etc/X11/xorg.conf.d/09-monitors.conf /etc/X11/xorg.conf.d/09-monitors.conf

# backup hyprdots scripts and replace with symlink
hyprd_scripts=($PWD/hyprdots/scripts/*)

for conf in ${hyprd_scripts[@]}; do
  if [ ! -f $config_path/hyprdots/scripts/$(basename $conf).bak ]; then
    mv -f $config_path/hyprdots/scripts/$(basename $conf) $config_path/hyprdots/scripts/$(basename $conf).bak
  fi

  rm -rf $config_path/hyprdots/scripts/$(basename $conf)
  cp -rf $conf $config_path/hyprdots/scripts/
done

# backup hyprdots wallbash and replace with symlink
if [ ! -f $config_path/hyprdots/wallbash/spotify.dcol.bak ]; then
  mv -f $config_path/hyprdots/wallbash/spotify.dcol $config_path/hyprdots/wallbash/spotify.dcol.bak
fi

rm -rf $config_path/hyprdots/wallbash/spotify.dcol
cp -rf $PWD/hyprdots/wallbash/spotify.dcol $config_path/hyprdots/wallbash/

# backup hyprdots theme and replace with symlink
if [ ! -f $config_path/hyprdots/theme.ctl.bak ]; then
  mv -f $config_path/hyprdots/theme.ctl $config_path/hyprdots/theme.ctl.bak
fi

rm -rf $config_path/hyprdots/theme.ctl
cp -rf $PWD/hyprdots/theme.ctl $config_path/hyprdots/

# check if user confs exists in hypr and created if not
if [ ! -d $config_path/hypr/user/ ]; then
  mkdir $config_path/hypr/user/
fi

# symlink all user confs to user directory
hypr_user_confs=($PWD/hypr/user/*)

for conf in ${hypr_user_confs[@]}; do
  rm -rf $config_path/hypr/user/$(basename $conf)
  cp -rf $conf $config_path/hypr/user/
done

# find modified confs and backup originals
hypr_confs=($PWD/hypr/*.conf)

for conf in ${hypr_confs[@]}; do
  if [ ! -f $config_path/hypr/$(basename $conf).bak ]; then
    mv -f $config_path/hypr/$(basename $conf) $config_path/hypr/$(basename $conf).bak
  fi

  rm -rf $config_path/hypr/$(basename $conf)
  cp -rf $conf $config_path/hypr/
done

# backup waybar modules and replace with symlink
waybar_mods=($PWD/waybar/modules/*)

for mod in ${waybar_mods[@]}; do
  if [ ! -f $config_path/waybar/modules/$(basename $mod).bak ]; then
    mv -f $config_path/waybar/modules/$(basename $mod) $config_path/waybar/modules/$(basename $mod).bak
  fi

  rm -rf $config_path/waybar/modules/$(basename $mod)
  cp -rf $mod $config_path/waybar/modules/
done

# symlink weather script
rm -rf $config_path/waybar/wittr.sh
cp -rf $PWD/waybar/wittr.sh $config_path/waybar/

# backup waybar ctl and replace with symlink
if [ ! -f $config_path/waybar/config.ctl.bak ]; then
  mv -f $config_path/waybar/config.ctl $config_path/waybar/config.ctl.bak
fi

rm -rf $config_path/waybar/config.ctl
cp -rf $PWD/waybar/config.ctl $config_path/waybar/

# backup wlogout layouts and replace with symlink
wlogout_layouts=($PWD/wlogout/*)

for layout in ${wlogout_layouts[@]}; do
  if [ ! -f $config_path/wlogout/$(basename $layout).bak ]; then
    mv -f $config_path/wlogout/$(basename $layout) $config_path/wlogout/$(basename $layout).bak
  fi

  rm -rf $config_path/wlogout/$(basename $layout)
  cp -rf $layout $config_path/wlogout/
done

# copy GTK theme to home
rm -rf $HOME/.themes/Dracula
cp -rf $PWD/.themes/Dracula $HOME/.themes/

# backup rofi style_3 and replace with symlink
if [ ! -f $config_path/rofi/styles/style_3.rasi.bak ]; then
  mv -f $config_path/rofi/styles/style_3.rasi $config_path/rofi/styles/style_3.rasi.bak
fi

rm -rf $config_path/rofi/styles/style_3.rasi
cp -rf $PWD/rofi/styles/style_3.rasi $config_path/rofi/styles/

# backup sddm theme and fix styles
if [ ! -d /usr/share/sddm/themes/Candy_bak ]; then
  sudo cp -rf /usr/share/sddm/themes/Candy /usr/share/sddm/themes/Candy_bak

  cp -rf $PWD/sddm/themes/Candy/* /usr/share/sddm/themes/Candy/
fi

printf '\n'
echo 'done'
printf '\n'

exit 0
