#!/bin/bash

# Update the system
sudo dnf update

# Install the requirements
sudo dnf install gcc kernel-headers kernel-devel

# Install the mod for Nvidia
sudo dnf install akmod-nvidia

# Install the Nvidia drivers
sudo dnf install xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power nvidia-settings
