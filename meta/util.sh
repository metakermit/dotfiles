#!/bin/bash

# logging functions

info_msg () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

user_msg () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success_msg () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail_msg () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  #exit
}
