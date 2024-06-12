#!/bin/bash

sudo apt-get install -y i3 sxhkd

# Install the i3status-rust
sudo apt-get install -y libssl-dev libsensors-dev libpulse-dev libnotmuch-dev libpipewire-0.3-dev

git clone https://github.com/greshake/i3status-rust
cd i3status-rust
cargo install --path . --locked
./install.sh
cd .. & rm -rf i3status-rust
