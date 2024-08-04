#!/bin/bash

# Install the Steam
flatpak install flathub com.valvesoftware.Steam

# Make .desktop for dmenu
sudo ln -s /var/lib/flatpak/exports/bin/com.valvesoftware.Steam /usr/bin/steam

# Install the Feral GameMode
sudo dnf update
sudo dnf install gamemode
