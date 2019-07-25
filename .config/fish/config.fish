# alias
alias lsa="ls -a"
alias lsal="ls -al"

# set GO workspace path
set -x -U GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# make Neovim the default editor
set --export EDITOR "nvim"

# FZF configuration
export FZF_TMUX=1 
export FZF_CTRL_T_OPTS="--preview 'bat {} | head -200'"

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end
