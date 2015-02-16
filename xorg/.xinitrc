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
HOSTNAME=$(hostname)
if [[ "ghost" == $HOSTNAME ]]; then
  xrandr --output DVI-0 --primary --left-of HDMI-0
elif [[ "demos" == $HOSTNAME ]]; then
  external_monitor left
fi

reset_peripherals

eval $(cat ~/.fehbg) &
xset +fp /usr/share/fonts/local
xsetroot -cursor_name left_ptr

start-pulseaudio-x11 & 
pactl set-sink-port 0 analog-output-lineout 
redshift -O 4500
compton &
synapse --startup &
start-pulseaudio-x11 &
volumeicon &
sxhkd &
exec bspwm 
