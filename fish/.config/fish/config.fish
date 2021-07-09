set fish_greeting
set -U fish_user_paths ~/bin $fish_user_paths
set -gx EDITOR nvim
source ~/.aliases
starship init fish | source
