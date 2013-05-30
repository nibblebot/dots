start-pulseaudio-x11
xset-restore
hotplug_monitor.sh
#trayer --widthtype request --height 16 --edge top &
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/misc
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
#urxvtd -q -f -o &
redshiftgui &
nm-applet &
#wicd-gtk --tray &
pa-applet &
compton -bcCGf -r 8 -t -10 -l -10 -o .4 --inactive-dim .10 -D 3 --vsync opengl --use-ewmh-active-win
xscreensaver &
#exec wmfs
#exec xmonad
exec awesome
# vim: set ft=sh:
