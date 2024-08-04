#!/bin/bash

# Add some options for dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null

sudo dnf autoremove
sudo dnf clean all

# Add auto-update
sudo dnf install dnf-automatic
sudo systemctl enable dnf-automatic.timer

# Upgrate the system
sudo dnf upgrade --refresh

# Enable the RPMFusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable the Fedora openh264 from Cisco
sudo dnf config-manager --enable fedora-cisco-openh264

sudo dnf update
