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

# Change caps lock to ctrl
/usr/bin/setxkbmap -option ctrl:nocaps &

# URxvt daemon
urxvtd -q -f &

# Wallpaper
feh --bg-scale ~/wallpaper.png ~/white.png --no-fehbg &

# Set qt5 style
export QT_STYLE_OVERRIDE="gtk"

exec i3
