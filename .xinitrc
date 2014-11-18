#!/bin/sh

XDG_DATA_DIRS=/usr/local/share/:/usr/share/
XDG_CONFIG_DIRS=/etc/xdg
XDG_DATA_HOME=$HOME/.local/share
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_DIRS XDG_CONFIG_DIRS XDG_DATA_HOME XDG_CONFIG_HOME XDG_CACHE_HOME

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && type dbus-launch >/dev/null; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
fi

# @DESKTOP
#xrandr --output DVI-0 --primary --left-of HDMI-0
#eval $(cat ~/.fehbg)&
#pactl set-sink-port 0 analog-output-lineout

# @LAPTOP
external_monitor left
reset_peripherals

# fonts, terminal, pointers
xset +fp /usr/share/fonts/local
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr

start-pulseaudio-x11 &

#redshiftgui --min &
#compton &
#synapse --startup &
#volumeicon &
#urxvtd &
sxhkd &
exec bspwm 
