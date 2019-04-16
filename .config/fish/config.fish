# alias
alias lsa="ls -a"
alias lsal="ls -al"

# set GO workspace path
set -x -U GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# make Neovim the default editor
set --export EDITOR "nvim"
