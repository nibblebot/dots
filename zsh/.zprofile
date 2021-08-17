#eval $(ssh-agent -s)
#ssh-add ~/.ssh/id_rsa
#
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx -- -ardelay 200 -arinterval 30
fi

