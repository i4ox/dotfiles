#!/bin/bash
# Content Creation

# Update the repos
sudo dnf update

## Install the OBS Studio
sudo dnf install obs-studio
sudo dnf install obs-studio-plugin-browser obs-studio-plugin-vlc-video obs-studio-plugin-vkcapture obs-studio-plugin-webkitgtk obs-studio-plugin-x264

## Install the codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

## Install the MPV
sudo dnf install mpv openh264
