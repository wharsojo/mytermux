#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

FS="$HOME/.mytermux/linux/ubuntu/linux-fs"

## if file .setup-linux.sh exists, run with ash shell
setup="./.setup-linux.sh"
echo "[ -s $setup ] && $setup" > $FS/root/.profile

## create `.setup-linux.sh` for initial setup
github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
linuxFS="$FS/root/.setup-linux.sh"
echo "apt-get update -y && apt-get upgrade -y" > $linuxFS
echo "apt-get install vim git zsh curl -y" >> $linuxFS
echo "git config --global --add oh-my-zsh.hide-dirty 1" >> $linuxFS
echo "$(curl -fsSL $ohMyZsh)" >> $linuxFS
sed -i 's/ +chsh -s.*//' $linuxFS
echo "rm ~/.setup-linux.sh" >> $linuxFS
echo "exit" >> $linuxFS
chmod +x $linuxFS

## Start Linux
#printf "$yellow [*] Start Linux$reset\n"
#sed -i 's/zsh --/bash --/g' ./start.sh
#./start.sh
#sed -i 's/bash --/zsh --/g' ./start.sh
#exit

