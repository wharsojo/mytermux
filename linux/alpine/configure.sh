#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

FS="$HOME/.mytermux/linux/alpine/linux-fs"

## if file .setup-linux.sh exists, run with ash shell
setup="./.setup-linux.sh"
echo "[ -s $setup ] && $setup" > $FS/root/.profile

## create `.setup-linux.sh` for initial setup
github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
linuxFS="$FS/root/.setup-linux.sh"
#echo "apk update" > $linuxFS
#echo "apk upgrade" >> $linuxFS
#echo "apk add vim git zsh curl" >> $linuxFS
#echo "$(curl -fsSL $ohMyZsh)" >> $linuxFS
#sed -i 's/ +chsh -s.*//' $linuxFS
echo "rm ~/.setup-linux.sh" >> $linuxFS
echo "exit" >> $linuxFS
chmod +x $linuxFS

## Start Linux
printf "$yellow [*] Start Linux$reset\n"
#sed -i 's/zsh --/sh --/g' ./start.sh
./start.sh
#sed -i 's/sh --/zsh --/g' ./start.sh

exit

