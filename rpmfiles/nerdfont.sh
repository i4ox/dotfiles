#!/bin/bash

# Check the requirements
[ -x "$(command -v wget)" ] || sudo dnf install wget
[ -x "$(command -v unzip)" ] || sudo dnf install unzip

# Download and extract zip with Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip
unzip CascadiaCode.zip -d cc

# Install the font
sudo mkdir /usr/share/fonts/CascadiaCode
sudo mv cc/*.ttf /usr/share/fonts/CascadiaCode
sudo fc-cache --force

# Delete the zip archive
rm -rf cc CascadiaCode.zip
