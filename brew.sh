brew update
brew upgrade

brew tap homebrew/versions
brew tap caskroom/versions
brew tap caskroom/cask
brew tap yukidarake/homebrew-793
brew update || true

brew install brew-cask
brew install git
brew install tig
brew install tmux
brew install zsh
brew install wget
brew install curl
brew install fasd

# python
brew install pyenv
brew install pyenv-virtualenv

# ruby
brew install rbenv
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash

# brew install emacs --cocoa --HEAD --use-git-head

# tmux powerline
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# other applications
brew cask install karabiner
brew cask install seil
brew cask install dropbox
brew cask install skype
#brew cask install sublime-text
brew cask install atom
brew cask install macdown
brew cask install yorufukurou
brew cask install flip4mac
#brew cask install divvy # install from AppStore
brew cask install google-chrome-canary
brew cask install google-japanese-input
brew cask install caffeine

brew linkapps

brew cleanup
