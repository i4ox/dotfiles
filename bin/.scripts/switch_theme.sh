#!/bin/bash

# GruvboxDark, GruvboxMaterialDark, nordDark, everforestDark, everblushDark, rosepineDark

function rofi_switch_theme_menu {
  echo -e "Gruvbox Dark\nGruvbox Material Dark\nNord Dark\nEverforest Dark\nEverblush Dark\nRosepine Dark" \
    | rofi -font "CaskaydiaCove Nerd Font 11" -show drun -show-icons -width 20 -dmenu -i
}

CHOSEN=$(rofi_switch_theme_menu)

DOTFILES="/home/i4ox/Projects/dotfiles"
BUILDER="$DOTFILES/src"

cd $BUILDER

ls

if [[ $CHOSEN = "Gruvbox Dark" ]]; then
  sed -i "s/gruvboxMaterialDark/gruvboxDark/" config.go
  sed -i "s/nordDark/gruvboxDark/" config.go
  sed -i "s/everforestDark/gruvboxDark/" config.go
  sed -i "s/everblushDark/gruvboxDark/" config.go
  sed -i "s/rosepineDark/gruvboxDark/" config.go
elif [[ $CHOSEN = "Gruvbox Material Dark" ]]; then
  sed -i "s/gruvboxDark/gruvboxMaterialDark/" config.go
  sed -i "s/nordDark/gruvboxMaterialDark/" config.go
  sed -i "s/everforestDark/gruvboxMaterialDark/" config.go
  sed -i "s/everblushDark/gruvboxMaterialDark/" config.go
  sed -i "s/rosepineDark/gruvboxMaterialDark/" config.go
elif [[ $CHOSEN = "Nord Dark" ]]; then
  sed -i "s/gruvboxMaterialDark/nordDark/" config.go
  sed -i "s/gruvboxDark/nordDark/" config.go
  sed -i "s/everforestDark/nordDark/" config.go
  sed -i "s/everblushDark/nordDark/" config.go
  sed -i "s/rosepineDark/nordDark/" config.go
elif [[ $CHOSEN = "Everforest Dark" ]]; then
  sed -i "s/gruvboxMaterialDark/everforestDark/" config.go
  sed -i "s/nordDark/everforestDark/" config.go
  sed -i "s/gruvboxDark/everforestDark/" config.go
  sed -i "s/everblushDark/everforestDark/" config.go
  sed -i "s/rosepineDark/everforestDark/" config.go
elif [[ $CHOSEN = "Everblush Dark" ]]; then
  sed -i "s/gruvboxMaterialDark/everblushDark/" config.go
  sed -i "s/nordDark/everblushDark/" config.go
  sed -i "s/everforestDark/everblushDark/" config.go
  sed -i "s/gruvboxDark/everblushDark/" config.go
  sed -i "s/rosepineDark/everblushDark/" config.go
elif [[ $CHOSEN = "Rosepine Dark" ]]; then
  sed -i "s/gruvboxMaterialDark/rosepineDark/" config.go
  sed -i "s/nordDark/rosepineDark/" config.go
  sed -i "s/everforestDark/rosepineDark/" config.go
  sed -i "s/everblushDark/rosepineDark/" config.go
  sed -i "s/gruvboxDark/rosepineDark/" config.go
fi

go run .
i3-msg restart
