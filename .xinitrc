xset-restore
hotplug_monitor.sh
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/misc
xrdb -merge ~/.Xresources
#xsetroot -cursor_name left_ptr
#eval $(cat ~/.fehbg)
urxvtd -q -f -o &
redshiftgui &
#trayer --widthtype request --height 16 --edge top &
exec startxfce4
