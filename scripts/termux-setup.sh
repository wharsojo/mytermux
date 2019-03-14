#!/data/data/com.termux/files/usr/bin/bash -e

## Setup colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

printf "$yellow"
printf "[*] Install termux packages ..."
pkg i vim git sed zsh curl wget tmux proot openssh -y

