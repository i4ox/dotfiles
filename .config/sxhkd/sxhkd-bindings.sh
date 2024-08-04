#!/bin/bash

printf "\033[31;1mMOD KEYMAPS\033[0m\n"

cat ~/.config/sxhkd/sxhkdrc | grep DESC_MOD -A 1 | sed -e "s/--/\ /g" | sed -e "s/# DESC_MOD: //g" | grep "\S" | awk 'NR%2{printf "\033[32;1m%s: \033[0m",$0;next;}1'

printf "\033[31;1mi3 KEYMAPS\033[0m\n"

cat ~/.config/sxhkd/sxhkdrc | grep DESC_I3 -A 1 | sed -e "s/--/\ /g" | sed -e "s/# DESC_I3: //g" | grep "\S" | awk 'NR%2{printf "\033[32;1m%s: \033[0m",$0;next;}1'

printf "\033[31;1mSYSTEM KEYMAPS\033[0m\n"

cat ~/.config/sxhkd/sxhkdrc | grep DESC_SYS -A 1 | sed -e "s/--/\ /g" | sed -e "s/# DESC_SYS: //g" | grep "\S" | awk 'NR%2{printf "\033[32;1m%s: \033[0m",$0;next;}1'

read
