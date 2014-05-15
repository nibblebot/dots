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

xrandr --output HDMI-0 --left-of DVI-0

hsetroot -solid "#fff1ca"

xset +fp /usr/share/fonts/local
xrdb -merge ~/.Xresources
start-pulseaudio-x11 &
xmodmap ~/.Xmodmap
xsetroot -cursor_name left_ptr
xset r rate 200 30
xset m 1 0 # no acceleration
urxvtd -q -f -o &
redshiftgui --min &
compton &
sxhkd &
exec bspwm
