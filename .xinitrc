start-pulseaudio-x11 &
eval $(cat ~/.fehbg)
hotplug_monitor.sh
xrdb -merge ~/.Xresources &
trayer --edge top --widthtype request --height 20 &
xsetroot -cursor_name left_ptr &
xset-restore &
#xset +fp /usr/share/fonts/local
#xset +fp /usr/share/fonts/artwiz-fonts
#xset +fp /usr/share/fonts/misc
urxvtd -q -f -o &
redshiftgui &
nm-applet &
pa-applet &
compton -cCGf -r 8 -t -10 -l -10 -o .4 --inactive-dim .10 -D 3 --vsync opengl --use-ewmh-active-win &
#xscreensaver &
exec xmonad
# vim: set ft=sh:
