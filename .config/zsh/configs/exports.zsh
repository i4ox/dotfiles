export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

source $HOME/.cargo/env

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(goenv init -)"
eval "$(pyenv init -)"

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Final PATH update
export PATH="$PATH:/opt/nvim-linux64/bin:$GOROOT/bin:$GOPATH/bin"
