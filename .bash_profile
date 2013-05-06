# Load the shell dotfiles
for file in ~/.{bash_prompt,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# for Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# for Git
export GIT_PROXY_COMMAND=~/git-proxy.sh

# for Android
export PATH=~/lib/adt-bundle-linux-x86_64/sdk/platform-tools:$PATH

# othre
export GREP_OPTIONS='--color=auto'
export GIT_PROXY_COMMAND=$HOME/git-proxy.sh
export PATH="$HOME/bin:$PATH"
