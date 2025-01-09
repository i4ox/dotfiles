# OpenSuse
alias rup="sudo zypper refresh && sudo zypper update"
alias clsf="clear && fastfetch"

# Neovim
alias v="nvim"
alias cvm="nvim ~/.config/nvim/"
alias czrc="nvim ~/.config/zsh/.zshrc"
alias czsh="nvim ~/.config/zsh/"

# Ansible
alias an="ansible"
alias ang="ansible-galaxy"
alias anp="ansible-playbook"

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Kubernetes
export KUBECONFIG=~/.kube/config
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Tmux
alias tmas="tmux attach-session -t"
alias tmks="tmux kill-session -t"
alias tmls="tmux ls"

# Network stuff
alias nm="nmap -sC -sV -oN nmap"
alias http="xh"

# Change default commands
alias cd="z"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias which-command="whence"
alias run-help="man"
