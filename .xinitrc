#!/bin/sh

hotplug_monitor.sh
xrdb -merge ~/.Xresources &
xsetroot -cursor_name left_ptr &
xset-restore &
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/artwiz-fonts
urxvtd -q -f -o &
redshiftgui &
compton &
exec xmonad
