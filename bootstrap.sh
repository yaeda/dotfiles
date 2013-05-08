#
# zsh (prezto)
#

# clone
if [ ! -d $HOME/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    echo "[ -f $HOME/dotfiles/zsh/.zshrc.mine ] && source $HOME/dotfiles/zsh/.zshrc.mine" >> "${ZDOTDIR:-$HOME}/.zshrc"
fi

# copy zsh configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# custom setting
ln -fs $HOME/dotfiles/zsh/zpreztorc $HOME/.zpreztorc


#
# Emacs
#
ln -fs  $HOME/dotfiles/emacs/init.el $HOME/.emacs.d/init.el
ln -nfs $HOME/dotfiles/emacs/inits   $HOME/.emacs.d/inits


#
# other dotfiles
#
for dotfile in .tmux.conf .gitconfig
do
    ln -fs $HOME/dotfiles/$dotfile $HOME/$dotfile
done
