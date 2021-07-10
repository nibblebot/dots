#!/bin/bash

XDG_DATA_DIRS=/usr/local/share/:/usr/share/
XDG_CONFIG_DIRS=/etc/xdg
XDG_DATA_HOME=$HOME/.local/share
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_DIRS XDG_CONFIG_DIRS XDG_DATA_HOME XDG_CONFIG_HOME XDG_CACHE_HOME

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && type dbus-launch >/dev/null; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
fi

xsetroot -cursor_name left_ptr
xmodmap ~/.Xmodmap
xset r rate 250 50
xset +fp ~/.fonts
xset fp rehash

external_monitor

~/.fehbg &
compton &
volumeicon &
nm-applet &
bars &
sxhkd &
exec bspwm 
