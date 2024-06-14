# General
alias cls="clear"
alias v="nvim"
alias aptu="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
alias clsn="clear && fastfetch"

# Files
alias rmi="rip"
alias ..="cd .."
alias ...="cd ../.."
alias lh="eza -l --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias lah="eza -al --color=always --icons --group-directories-first --octal-permissions --no-permissions"
alias ls="eza --color=always --icons --group-directories-first"
alias las="eza -a --color=always --icons --group-directories-first"
alias lt="eza -aT --color=always --icons --group-directories-first"

# Troubleshooting
alias df="df -h"
alias free="free -h"

# Git
alias g="git"
alias glog="git log --graph --decorate --oneline"

# Docker
alias dockerrm='docker rm -v $(docker ps -aq -f status=exited)'

# DevTools
alias h="hugo"
