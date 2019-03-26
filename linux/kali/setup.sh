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

## Setup URL for download Linux FS 
URL="https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Kali/${name}"
file="kali-rootfs-${name}.tar.gz"
FS="$HOME/.mytermux/linux/kali/linux-fs"

## Download compressed Linux FS
printf "$yellow [*] Download: $file ...$reset\n"
rm -rf $FS
mkdir -p $FS  && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf ${file} --exclude='dev'||:

## Remove compressed Linux FS
chmod +rwx ../linux-fs root
rm $file
cd ..

## Configure linux
printf "$yellow [*] Configure linux$reset\n"
echo 'nameserver 8.8.8.8' > $FS/etc/resolv.conf

printf "\n"

