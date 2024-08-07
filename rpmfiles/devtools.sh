#!/bin/bash

# Check the requirements
[ -x "$(command -v curl)" ] || sudo dnf install curl

echo 'Want you install the Visual Studio Code? [y/n]'
read vscode
if [ "$vscode" == "y" ]; then
  # Install the Code editor - VSCode
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
  sudo dnf update
  sudo dnf install code
fi

echo 'Want you install the Api Dash? [y/n]'
read apidash
if [ "$apidash" == "y" ]; then
  # Install the Rest client - API Dash
  curl -LO https://github.com/foss42/apidash/releases/latest/download/apidash-linux-x86_64.rpm
  sudo dnf install ./apidash-linux-x86_64.rpm
  rm -rf apidash-linux-x86_64.rpm
fi
