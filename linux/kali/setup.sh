#!/data/data/com.termux/files/usr/bin/bash -e

_modules="$HOME/.mytermux/linux/_module"s

## Setup Variables
. $_modules/init-var-colors.sh
. $_modules/init-var-arch.sh

## Setup URL for download Linux FS 
URL="https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Kali/${arch}"
file="kali-rootfs-${arch}.tar.gz"

## Download compressed Linux FS into _cache folder
. $_modules/download-linux.sh kali $*

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf ${file} --exclude='dev' > /dev/null
chmod +rwx -R $FS

## Remove compressed Linux FS
chmod +rwx ../linux-fs root
rm $file
cd ..

## Configure linux
. $_modules/configure-linux.sh

