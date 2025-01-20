#!/usr/bin/env bash

# Copy some files
cp ./.xinitrc ~/.xinitrc
cp ./.Xresources ~/.Xresources

# Install the configs
stow -D .
stow .
