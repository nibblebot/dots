path+=('/home/josh/bin')
path+=('/home/josh/.local/bin')
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# The following lines were added by compinstall
autoload -U compinit
compinit
# End of lines added by compinstall
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000


if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

# Emacs keybindings
bindkey -e

eval "$(starship init zsh)"

