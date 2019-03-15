#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
reset='\x1b[0m'
red='\x1b[1;31m'
blue='\x1b[1;34m'
yellow='\x1b[1;33m'

printf "$yellow [*] Install termux packages ...$reset\n"
# pkg i vim git sed zsh curl wget tmux proot openssh -y

printf "$yellow [*] Setup storage ...$reset\n"
#termux-setup-storage

## Install oh-my-zsh on termux
printf "$yellow [*] Setup oh my zshell ...$reset\n"
github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
# sh -c "$(curl -fsSL $ohMyZsh)"
# chsh -s zsh

printf "$yellow [*] Setup default startup$reset\n"
cp zshenv ~/.zshenv

