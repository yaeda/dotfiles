source ~/.config/fish/aliases.fish

# local config
if test -e ~/.local_config.fish
    source ~/.local_config.fish
end

# env
set fish_user_pathes $HOME/.nodebrew/current/bin