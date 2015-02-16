#
# ~/.bash_profile
#

export PATH=${PATH}:$HOME/bin
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="chromium"
export TERM="xterm"
export JAVA_HOME="/usr"
export PAGER="less"
export LESS="-R"
export LC_CTYPE=$LANG

export WINEARCH=win32

eval `keychain --agents ssh --eval id_rsa`

[[ -f ~/.bashrc ]] && . ~/.bashrc
