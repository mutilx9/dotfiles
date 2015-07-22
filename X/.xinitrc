#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Set the cursor
/usr/bin/xsetroot -cursor_name left_ptr &

# Ensure num lock on
/usr/bin/numlockx &

# Xresources
/usr/bin/xrdb -merge ~/.Xresources &

# Disable DPMS and prevent screen from blanking
/usr/bin/xset -dpms &
/usr/bin/xset s off &

# Disable bell
/usr/bin/xset b off &

# Change caps lock to ctrl
/usr/bin/setxkbmap -option ctrl:nocaps &

# Start PulseAudio
/usr/bin/pulseaudio --start &

# Polkit daemon
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# URxvt daemon
/usr/bin/urxvtd -q -f &

# Wallpaper
feh --bg-scale ~/wallpaper.png ~/white.png --no-fehbg &

# Set qt5 style
export QT_STYLE_OVERRIDE="gtk"

exec i3
