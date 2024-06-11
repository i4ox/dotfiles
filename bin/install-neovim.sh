#!/bin/bash

[ -x "$(command -v curl)" ] || sudo apt-get install -y curl
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
source ~/.zshrc
