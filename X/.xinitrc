#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Set the cursor
xsetroot -cursor_name left_ptr &

# Xresources
xrdb -merge ~/.Xresources &

# Disable DPMS and prevent screen from blanking
xset -dpms &
xset s off &

# Disable bell
xset b off &

# Set layout to us and caps lock to ctrl
setxkbmap -model pc104 -layout us -variant altgr-intl -option ctrl:nocaps

# Wallpaper
feh --bg-scale ~/wallpaper.png --no-fehbg &

# Set qt5 style
export QT_STYLE_OVERRIDE="gtk"

exec i3
