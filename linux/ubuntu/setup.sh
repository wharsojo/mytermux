#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

declare -A arch=(
[aarch64]=arm64
[x86_64]=amd64
[amd64]=amd64
[i*86]=i386
[arm]=armhf
)
name=${arch[$(uname -m)]}

## Setup URL for download Ubuntu Linux
URL="https://partner-images.canonical.com/core/bionic/current/"
file="ubuntu-bionic-core-cloudimg-$name-root.tar.gz"
FS="$HOME/.mytermux/linux/ubuntu/linux-fs"

## Download compressed Ubuntu Linux
printf "$yellow [*] Download: $file ...$reset\n"
rm -rf $FS
mkdir -p $FS && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf $file --exclude='dev'||:

## Remove compressed Ubuntu Linux
rm $file
cd ..

## Configure linux
printf "$yellow [*] Configure linux $reset\n"
echo 'nameserver 8.8.8.8' > $FS/etc/resolv.conf

## if file .setup-linux.sh exists, run with ash shell
setup="./.setup-linux.sh"
echo "[ -s $setup ] && sh $setup" > $FS/root/.profile

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

## Start Linux
printf "$yellow [*] Start Linux$reset\n"
sed -i 's/zsh --/bash --/g' ./start.sh
./start.sh
sed -i 's/bash --/zsh --/g' ./start.sh
exit

