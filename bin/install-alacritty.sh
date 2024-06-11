#!/bin/bash

# Install dependencies
sudo apt-get install -y build-essential cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Build the alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release --no-default-features --features=x11

# Create the desktop entry
[[ -x "$(command -v desktop-file-install)" ]] || sudo apt-get install -y desktop-file-utils
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Delete repo
cd .. && sudo rm -rf alacritty
