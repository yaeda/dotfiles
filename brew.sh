brew update
brew upgrade

brew tap homebrew/versions
brew tap caskroom/versions
brew tap caskroom/cask
brew update || true

brew install brew-cask
brew install git
brew install ghq
brew install tig
brew install tmux
brew install reattach-to-user-namespace # tmux with system clipboard
brew install fish
brew install wget
brew install curl
brew install fasd
brew install fzf
brew install diff-so-fancy
brew install icdiff

# node
brew install nodebrew

# brew install emacs --cocoa --HEAD --use-git-head

#
# other applications
#

brew cask install android-studio
brew cask install bitbar
brew cask install caffeine
brew cask install deepl
brew cask install discord
brew cask install font-fira-code
brew cask install font-ricty-diminished
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install karabiner-elements
brew cask install kindle
brew cask install logitech-options
brew cask install sketch
brew cask install slack
brew cask install sony-ps4-remote-play
brew cask install unity-hub
brew cask install visual-studio-code

brew cleanup
