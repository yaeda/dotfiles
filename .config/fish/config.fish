. ~/.config/fish/aliases.fish

# nodebrew
set -U fish_user_paths $fish_user_paths $HOME/.nodebrew/current/bin

# local config
if test -e ~/.local_config.fish
    . ~/.local_config.fish
end
