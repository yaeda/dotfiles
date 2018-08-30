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
brew cask install karabiner-elements
brew cask install dropbox
#brew cask install atom
brew cask install visual-studio-code
brew cask install night-owl
#brew cask install spectacle
brew cask install google-chrome-canary
brew cask install google-japanese-ime
brew cask install caffeine
brwe cask install slack

brew cleanup
