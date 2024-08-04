#!/bin/bash

[ -x "$(command -v zsh)" ] || sudo dnf install zsh -y
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
cp ~/.local/share/asa-dotfiles/.config/zsh/.zshrc ~/.zshrc
mkdir ~/.config/zsh
cp -r ~/.local/share/asa-dotfiles/.config/zsh/configs ~/.config/zsh
