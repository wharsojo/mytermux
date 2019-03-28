#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors 
. $HOME/.mytermux/linux/_modules/init-var-colors.sh

github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"

## Install termux packages & setup storages
printf "$yellow [*] Install termux packages ...$reset\n"
pkg i vim git sed zsh curl wget tmux proot openssh -y

printf "$yellow [*] Setup storage ...$reset\n"
termux-setup-storage

## Setup default shell & startup 
printf "$yellow [*] Setup default shell & startup$reset\n"
ln -s $HOME/.mytermux/scripts/mtx.sh $PREFIX/bin/mtx
cp zshenv $HOME/.zshenv
chsh -s zsh

## Install oh-my-zsh on termux
printf "$yellow [*] Setup oh my zshell ...$reset\n"
curl -fsSL $ohMyZsh | sh

