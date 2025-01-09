cursor_vis() {
  echo "\x1b[?25h"
}

ibeam_cursor() {
  printf '\033[6 q'
}

kk() {
  printf "\e[2J\e[H"
}

16col() {
  for i in {30..37}; do
    printf "$i \u2B62  \e[${i}m\u25C6\e[0m\n"
  done
}

256col() {
  for i in {0..255}; do
    printf "\e[1;38;5;${i}m${i}\e[0m "
  done
  
  printf "\n"
}

s() {
  if [[ "$SHELL" =~ "zsh" ]]; then
    source $HOME/.config/zsh/.zshrc
  elif [[ "$SHELL" =~ "bash" ]]; then
    source $HOME/.bash_profile
  fi
}
