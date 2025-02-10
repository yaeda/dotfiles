# git

abbr -a -- gs 'git status --short --branch'
abbr -a -- gd 'git diff'
abbr -a -- go 'git checkout'
abbr -a -- gl 'git log --graph --date=short --pretty="format:%C(yellow)%h %C(cyan)%ad %C(green)%an%Creset%x09%s %C(red)%d%Creset"'
abbr -a -- gc 'git branch --merged|egrep -v "\*|main"|xargs git branch -d;git fetch --prune'

# ghq

abbr -a -- qg 'ghq get -p'

# chezmoi

abbr -a -- cz 'chezmoi'
