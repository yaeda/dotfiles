source ~/.config/fish/aliases.fish

# local config
if test -e ~/.local_config.fish
    source ~/.local_config.fish
end

# env
status --is-interactive && source (rbenv init -|psub)
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set fish_user_paths $HOME/.fastlane/bin $HOME/.nodebrew/current/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $HOME/Library/Python/2.7/bin /Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin /usr/local/bin
set -x JAVA_HOME /Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home
set -g fish_user_paths "/usr/local/opt/avr-gcc@7/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/lib/ruby/gems/2.7.0/bin" $fish_user_paths
