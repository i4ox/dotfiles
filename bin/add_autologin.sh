#!/bin/bash

# Get the user
user="$(getent group 1000 | cut -d':' -f 1)"

# Create the tty1 service
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
[ -x "$(command -v wget)" ] || sudo apt install  -y wget
wget wget https://raw.githubusercontent.com/i4ox/dotfiles/main/misc/autologin.conf
sed -i "s/i4ox/${user}/g" autologin.conf
sudo mv autologin.conf /etc/systemd/system/getty@tty1.service.d/override.conf
