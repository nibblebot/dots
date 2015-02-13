# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set show-all-if-ambiguous on
set show-all-if-unmodified on

source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
source /usr/lib/z.sh

source ~/.bash_colors
source ~/.bash_aliases
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND='__git_ps1 "($?) ${On_Green}${BWhite} \u@\h ${Color_Off}" " ${Yellow}\w${Color_Off}\n> "'

eval $(dircolors ~/.dircolors)
