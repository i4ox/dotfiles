# GoEnv && Golang
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# PyEnv && Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Nvm and NodeJS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Utils
eval "$(zoxide init zsh)"
eval "$(ssh-agent -s)"
eval "$(starship init zsh)"

# Mics
export CURSOR_TYPE="ibeam"
