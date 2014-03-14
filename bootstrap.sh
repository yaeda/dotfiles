#!/bin/bash

#
# Homebrew (MacOS)
#
if [ `uname` = "Darwin" ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew bundle
fi


#
# zsh (prezto)
#

# clone
if [ ! -d $HOME/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# copy zsh configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# custom setting
echo "[ -f $HOME/dotfiles/zsh/.zshrc.mine.Common ] && source $HOME/dotfiles/zsh/.zshrc.mine.Common" >> "${ZDOTDIR:-$HOME}/.zshrc"
echo "[ -f $HOME/dotfiles/zsh/.zshrc.mine.`uname` ] && source $HOME/dotfiles/zsh/.zshrc.mine.`uname`" >> "${ZDOTDIR:-$HOME}/.zshrc"
echo "[ -f $HOME/.zshrc.mine.Local ] && source $HOME/.zshrc.mine.Local" >> "${ZDOTDIR:-$HOME}/.zshrc"
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
mkdir -p $HOME/.emacs.d
ln -fs  $HOME/dotfiles/emacs/init.el $HOME/.emacs.d/init.el
ln -nfs $HOME/dotfiles/emacs/inits   $HOME/.emacs.d/inits


#
# other dotfiles
#
for dotfile in .tmux.conf .gitconfig .tmux-powerlinerc .gemrc
do
    ln -fs $HOME/dotfiles/$dotfile $HOME/$dotfile
done


#
# Git
#
git config user.name "Takeshi YAEDA"
git config user.email t.yaeda@gmail.com

# pre-comit
mkdir $HOME/.git_template/hooks
chmod a+x $HOME/dotfiles/pre-commit
ln -fs $HOME/dotfiles/pre-commit $HOME/.git_template/hooks/pre-commit


#
# Atom
#
ln -fs $HOME/dotfiles/atom $HOME/.atom


#
# PCKeyboardHack setting
#
if [ `uname` = "Darwin" ]; then
  sh $HOME/dotfiles/pckeyboardhack-import.sh
fi


#
# Font
#

# Ricty for powerline
if [ `uname` = "Darwin" ]; then
  brew tap sanemat/font
  brew install --powerline --vim-powerline --dz ricty
fi
