#
# Homebrew
#
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew bundle

#
# zsh (prezto)
#

# clone
if [ ! -d $HOME/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    echo "[ -f $HOME/dotfiles/zsh/.zshrc.mine.`uname` ] && source $HOME/dotfiles/zsh/.zshrc.mine.`uname`" >> "${ZDOTDIR:-$HOME}/.zshrc"
    echo "[ -f $HOME/dotfiles/zsh/.zshrc.mine.Common ] && source $HOME/dotfiles/zsh/.zshrc.mine.Common" >> "${ZDOTDIR:-$HOME}/.zshrc"
    echo "[ -f $HOME/.zshrc.mine.Local ] && source $HOME/.zshrc.mine.Local" >> "${ZDOTDIR:-$HOME}/.zshrc"
fi

# copy zsh configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# custom setting
ln -fs $HOME/dotfiles/zsh/zpreztorc $HOME/.zpreztorc

#
# Tmux
#
mkdir -p $HOME/.tmux
git clone git://github.com/erikw/tmux-powerline.git $HOME/.tmux/tmux-powerline


#
# Emacs
#
#brew install emacs --cocoa --HEAD --use-git-head
ln -fs  $HOME/dotfiles/emacs/init.el $HOME/.emacs.d/init.el
ln -nfs $HOME/dotfiles/emacs/inits   $HOME/.emacs.d/inits


#
# other dotfiles
#
for dotfile in .tmux.conf .gitconfig .tmux-powerlinerc
do
    ln -fs $HOME/dotfiles/$dotfile $HOME/$dotfile
done


#
# Font
#

# Ricty for powerline
brew tap sanemat/font
brew install --powerline --vim-powerline ricty
