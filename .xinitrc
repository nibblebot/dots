#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#start-pulseaudio-x11 &
#hotplug_monitor.sh &
xrdb -merge ~/.Xresources &
#xsetroot -cursor_name left_ptr &
xset-restore &
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/artwiz-fonts
urxvtd -q -f -o &
redshiftgui &
compton &
exec awesome
#exec xmonad
