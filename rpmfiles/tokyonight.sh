#!/bin/bash

[ -x "$(command -v lxappearance)" ] || sudo dnf install lxappearance

git clone https://github.com/stronk-dev/Tokyo-Night-Linux.git
sudo mv Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes/TokyoNight
rm -rf Tokyo-Night-Linux 
