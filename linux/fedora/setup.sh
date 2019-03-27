#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

## Setup URL for download Linux FS 
URL="https://dl.fedoraproject.org/pub/fedora/linux/releases/29/Container/$(uname -m)/images/"
#file="Fedora-Container-Minimal-Base-29-1.2.aarch64.tar.xz"
file="Fedora-Container-Base-29-1.2.aarch64.tar.xz"
FS="$HOME/.mytermux/linux/fedora/linux-fs"
CC="$HOME/.mytermux/linux/_cache"

## Download compressed Linux FS
printf "$yellow [*] Download: $file ...$reset\n"

mkdir -p $CC && cd $CC
if [ ! -f $file ]; then
   curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file
fi

rm -rf $FS
mkdir -p $FS  && cd $FS

ln -s $CC/$file $file

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
tar xvf $file --strip-components=1 --exclude json --exclude VERSION
printf "$blue 2nd extract: layer.tar$reset\n"
tar -xpf layer.tar

## Remove compressed Linux FS
chmod +rwx -R $FS
rm layer.tar
rm $file
cd ..

## Configure linux
printf "$yellow [*] Configure linux$reset\n"
echo 'nameserver 8.8.8.8' > $FS/etc/resolv.conf

printf "\n"

