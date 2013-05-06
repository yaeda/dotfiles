#
# zsh (prezto)
#

# clone
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# copy zsh configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# chsh -s /bin/zsh

# custom setting
# echo "[ -f $HOME/.zshrc.mine ] && source $HOME/dotfile/.zshrc.mine" >> "${ZDOTDIR:-$HOME}/.zshrc"
