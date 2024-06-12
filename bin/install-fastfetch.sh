#!/bin/bash

[[ -x "$(command -v wget)" ]] || sudo apt-get install -y wget
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.15.0/fastfetch-linux-amd64.deb
sudo dpkg --install ./fastfetch-linux-amd64.deb
rm -rf ./fastfetch-linux-amd64.deb
