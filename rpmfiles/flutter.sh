#!/bin/bash

# Install the FVM
brew tap leoafarias/fvm
brew install fvm

# Install Dart and Flutter
fvm install 3.22.3
fvm global 3.22.3

# Call the `flutter doctor` and install Dart SDK(because this is first Flutter call)
fvm flutter doctor
