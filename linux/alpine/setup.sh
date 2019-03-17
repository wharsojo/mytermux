#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

## Setup URL for download Alpine Linux 
URL="http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/$(uname -m)"
VER=$(curl -s $URL/latest-releases.yaml | grep -m 1 -o version.* | sed -e 's/[^0-9.]*//g' -e 's/-$//')
if [ -z "$VER" ] ; then
  print "$red [!] Error getting Alpine latest version."
  exit 1
fi
file="alpine-minirootfs-$VER-$(uname -m).tar.gz"
FS="$HOME/.mytermux/linux/alpine/linux-fs"

## Download compressed Alpine Linux
printf "$yellow [*] Download: $file ...$reset\n"
rm -rf $FS
mkdir -p $FS/binds && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
tar -zxf $file

## Remove compressed Alpine Linux
rm $file
cd ..

## Configure linux
printf "$yellow [*] Configure linux$reset\n"
echo 'nameserver 8.8.8.8' > $FS/etc/resolv.conf

## if file .setup-linux.sh exists, run with ash shell
setup="./.setup-linux.sh"
echo "[ -s $setup ] && sh $setup" > $FS/root/.profile

## create `.setup-linux.sh` for initial setup
github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
linuxFS="$FS/root/.setup-linux.sh"
echo "apk update" > $linuxFS
echo "apk upgrade" >> $linuxFS
echo "apk add vim git zsh curl" >> $linuxFS
echo "$(curl -fsSL $ohMyZsh)" >> $linuxFS
sed -i 's/ +chsh -s.*//' $linuxFS
echo "rm ~/.setup-linux.sh" >> $linuxFS
echo "exit" >> $linuxFS

## Start Linux
printf "$yellow [*] Start Linux$reset\n"
sed -i 's/zsh --/sh --/g' ./start.sh
./start.sh
sed -i 's/sh --/zsh --/g' ./start.sh

exit

