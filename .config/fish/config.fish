# alias
alias lsa="ls -a"
alias lsal="ls -alh"
alias lsla="ls -alh"
alias prune="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D"
# set GO workspace path
set -x -U GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# make Neovim the default editor
set --export EDITOR "nvim"

# FZF configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude node_modules --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1 
export FZF_CTRL_T_OPTS="--preview 'bat {} | head -200'"

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
