#!/bin/bash

sudo apt-get install -y network-manager wpasupplicant network-manager-gnome

[ -x "$(command -v wget)" ] || sudo apt-get install -y wget

wget https://raw.githubusercontent.com/i4ox/dotfiles/main/misc/NetworkManager.conf
sudo chmod 644 NetworkManager.conf
sudo mv NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
wget https://raw.githubusercontent.com/i4ox/dotfiles/main/misc/interfaces
sudo chmod 600 interfaces
sudo mv interfaces /etc/network/interfaces

# Отключаем networking
sudo systemctl stop networking
sudo systemctl disable networking
sudo systemctl stop wpa_supplicant
sudo systemctl disable wpa_supplicant

# Включаем Network-Manager
sudo systemctl enable NetworkManager
sudo systemctl restart NetworkManager
