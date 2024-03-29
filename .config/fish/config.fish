# alias
alias lsa="ls -a"
alias lsal="ls -alh"
alias lsla="ls -alh"
alias prune="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D"

# set GO workspace path
set -x -U GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# make Neovim the default editor
set --export EDITOR nvim

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
# eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# ------------
# VSCO specific configs
# vsco cli alias
alias VPROD='vsco -e prod'
alias va='vsco -e admin'
alias vd='vsco -e dev'
alias vs='vsco -e preprod'


# vsco runbook helper scripts
set -x PATH $PATH $HOME/vsco/runbooks/bin

# vsco ssh keys
function lssh -d "Load ssh keys"
    ssh-add ~/.ssh/github_rsa
    ssh-add ~/.ssh/vsco_rsa
end

# vsco launch browser in debug mode
function launch_debug_chrome_browser -d "Launch Chrome in Debug mode"
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222
end

fish_add_path /usr/local/opt/node@16/bin
fish_add_path /usr/local/opt/openjdk@11/bin
fish_add_path /usr/local/opt/mysql-client/bin


# kubectl completion for fish
kubectl completion fish | source

# https://starship.rs/guide/#%F0%9F%9A%80-installation
starship init fish | source

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# pnpm
set -gx PNPM_HOME /Users/ehis/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# vscode fish integration
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)
