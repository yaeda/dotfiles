#
# zsh (prezto)
#

# clone
[ ! -d $HOME/.zprezto ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# copy zsh configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# custom setting
ln -fs $HOME/dotfiles/zsh/zpreztorc $HOME/.zpreztorc
[ -f $HOME/.zshrc ] && echo "source $HOME/dotfiles/zsh/.zshrc.mine" >> "${ZDOTDIR:-$HOME}/.zshrc"


#
# Emacs
#
ln -fs $HOME/dotfiles/emacs/init.el $HOME/.emacs.d/init.el
ln -fs $HOME/dotfiles/emacs/inits   $HOME/.emacs.d/inits


#
# other dotfiles
#
for dotfile in $HOME/dotfiles/.*
do
    ln -fs $dotfile $HOME/${dotfile:t}
done
