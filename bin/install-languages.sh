#!/bin/bash

## USE ONLY AFTER SETUP THE ZSH

# Install NodeJS(all exports already setup)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc
nvm install --lts

# Install Python
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
source ~/.zshrc
pyenv install 3.12.4
pyenv global 3.12.4

# Install Golang
git clone https://github.com/go-nv/goenv.git ~/.goenv
source ~/.zshrc
goenv install 1.22.4
goenv global 1.22.4

# Install Cargo and Rust
[[ -x "$(command -v curl)" ]] || sudo apt-get install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
