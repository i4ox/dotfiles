#!/bin/bash

# Install the requirements
sudo dnf install dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libxcb-devel libGL-devel libEGL-devel libepoxy-devel meson pcre2-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel xcb-util-devel

# Build the picom
git clone https://github.com/pijulius/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
ninja -C build install

# Uninstall the repo
cd ..
rm -rf picom
