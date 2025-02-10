if status is-interactive
    # Commands to run in interactive sessions can go here

    # Homebrew
    eval (/opt/homebrew/bin/brew shellenv)

    # Set up fzf key bindings
    fzf --fish | source

    # nodenv
    nodenv init - fish | source
    #source (node init -|psub)

    # rbenv
    rbenv init - fish | source

    # starship
    starship init fish | source
end

#
# Environment variable
#

set -gx ANDROID_HOME $HOME/Library/Android/sdk
#set -gx ANDROID_SDK_ROOT $HOME/Library/Android/sdk
#set -gx JAVA_HOME /Applications/"Android Studio.app"/Contents/jbr/Contents/Home
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

#
# Path
#

#fish_add_path $JAVA_HOME/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/emulator
#fish_add_path $ANDROID_HOME/tools
#fish_add_path $ANDROID_HOME/tools/bin
