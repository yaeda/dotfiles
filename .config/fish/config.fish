if test -e ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

# local config
if test -e ~/.local_config.fish
    source ~/.local_config.fish
end

# env
if type -q rbenv
    status --is-interactive && source (rbenv init -|psub)
end
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -x JAVA_HOME /Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home

# reset fish_user_paths
set -g fish_user_paths

set -g fish_user_paths /usr/local/bin $fish_user_paths
set -g fish_user_paths "/usr/local/opt/avr-gcc@7/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/lib/ruby/gems/2.7.0/bin" $fish_user_paths

set -g fish_user_paths $HOME/.nodebrew/current/bin $fish_user_paths

set -g fish_user_paths $HOME/Library/Python/2.7/bin $fish_user_paths

set -g fish_user_paths $HOME/.fastlane/bin $fish_user_paths

set -g fish_user_paths $JAVA_HOME/bin $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/emulator $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/tools $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/tools/bin $fish_user_paths

