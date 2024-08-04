export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export NVM_DIR="$HOME/.nvm"
export DART_BIN="$HOME/.pub-cache/bin"

eval "$(zoxide init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f /home/asa/.dart-cli-completion/zsh-config.zsh ]] && . /home/asa/.dart-cli-completion/zsh-config.zsh || true

export PATH="$PATH:$DART_BIN"
