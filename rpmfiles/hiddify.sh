#!/bin/bash

# Check the requirements
[ -x "$(command -v curl)" ] || sudo dnf install curl

curl -LO https://github.com/hiddify/hiddify-next/releases/download/v2.0.5/Hiddify-rpm-x64.rpm
sudo dnf install ./Hiddify-rpm-x64.rpm

sudo rm -rf Hiddify-rpm-x64.rpm
