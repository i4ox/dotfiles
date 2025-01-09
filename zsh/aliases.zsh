# Neovim
alias v="nvim"
alias cvm="nvim ~/.config/nvim/"
alias czrc="nvim ~/.zshrc"
alias czsh="nvim ~/.config/zsh/"

# Ansible
alias an="ansible"
alias ang="ansible-galaxy"
alias anp="ansible-playbook"

# Docker
alias d="docker"
alias dcc="docker-compose"
alias di="docker images"
alias dps="docker ps -a"

# Git
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend -m"
alias gco="git checkout"
alias gl="git pull origin"
alias gp="git push origin"
alias grhh="git reset --hard HEAD"
alias gs="git status -sb"
alias gsh="git stash"
alias gt="git tag"
alias glog="git log --graph --decorate --oneline"

# Tmux
alias tmas="tmux attach-session -t"
alias tmks="tmux kill-session -t"
alias tmls="tmux ls"

# Change default commands
alias cd="z"
alias bat="batcat --style=plain"
alias lh="eza --icons -l --color=always --group-directories-first --octal-permissions --no-permissions"
alias lah="eza --icons -al --color=always --group-directories-first --octal-permissions --no-permissions"
alias ls="eza --icons --color=always --group-directories-first"
alias las="eza --icons -a --color=always --group-directories-first"
alias lt="eza --icons -aT --color=always --group-directories-first"
alias which-command="whence"
alias run-help="man"
