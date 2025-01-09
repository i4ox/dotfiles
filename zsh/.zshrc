export DOTFILES="$HOME/.config"

source $DOTFILES/zsh/env.zsh --source_only
source $DOTFILES/zsh/cmd.zsh --source_only
source $DOTFILES/zsh/aliases.zsh --source_only
source $DOTFILES/zsh/zap.zsh --source_only
source $DOTFILES/zsh/hooks.zsh --source_only

setopt extended_glob
setopt BASH_REMATCH

if [[ $CURSOR_TYPE == "ibeam" ]]; then
  ibeam_cursor
fi

# Кастомные настройки для каждой отдельной машины
if [[ -f "$DOTFILES/zsh/custom.zsh" ]]; then
  source $DOTFILES/zsh/custom.zsh --source_only
fi
