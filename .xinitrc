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

xrandr --output DVI-0 --primary --left-of HDMI-0
eval $(cat ~/.fehbg)&

xset +fp /usr/share/fonts/local
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
xsetroot -cursor_name left_ptr
xset r rate 200 30
xset m 1 0 # no acceleration
start-pulseaudio-x11 2> ~/.logs/pulseaudio&
pactl set-sink-port 0 analog-output-lineout

redshiftgui --min 2> ~/.logs/redshift &
compton 2> ~/.logs/compton &
synapse --startup &
#plank 2> ~/.logs/plank&
#tint2 2> ~/.logs/tint2&
volumeicon ~/.logs/volumeicon &
urxvtd &

sxhkd 2> ~/.logs/sxhkd &

#exec startdwm
exec bspwm 2> ~/.logs/bspwm
#exec openbox-session 2> ~/.logs/openbox
#exec wingo 2> ~/.logs/wingo
