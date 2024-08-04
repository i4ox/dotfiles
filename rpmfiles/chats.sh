#!/bin/bash

# Update the system
sudo dnf update

# Check the requirements
[ -x "$(command -v curl)" ] || sudo dnf install curl

# Install the Telegram
sudo dnf install telegram-desktop

# Install the Discord
curl -LO https://dl.discordapp.net/apps/linux/0.0.62/discord-0.0.62.tar.gz
tar xzf discord-0.0.62.tar.gz
rm -rf discord-0.0.62.tar.gz
sudo mv Discord ~/.local/share/discord
sudo ln -s ~/.local/share/discord/Discord /usr/bin/discord

# Install the BetterDiscord
curl -LO https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage
sudo chmod +x ./BetterDiscord-Linux.AppImage
./BetterDiscord-Linux.AppImage

# Delete the AppImage
rm ./BetterDiscord-Linux.AppImage
