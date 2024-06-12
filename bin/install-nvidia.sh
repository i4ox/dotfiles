#!/bin/bash

sudo apt-get install -y linux-headers-$(uname -r)
sudo apt-get install -y nvidia-driver firmware-misc-nonfree
sudo dpkg --add-architecture i386 && sudo apt-get update -y
sudo apt install -y nvidia-driver-libs:i386
