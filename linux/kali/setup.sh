#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Variables
. $HOME/.mytermux/linux/_modules/init-var-colors.sh
. $HOME/.mytermux/linux/_modules/init-var-arch.sh

## Setup URL for download Linux FS 
URL="https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Kali/${arch}"
file="kali-rootfs-${arch}.tar.gz"

## Download compressed Linux FS into _cache folder
. $HOME/.mytermux/linux/_modules/download-linux.sh kali

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf ${file} --exclude='dev'||:
chmod +rwx -R $FS

## Remove compressed Linux FS
chmod +rwx ../linux-fs root
rm $file
cd ..

## Configure linux
. $HOME/.mytermux/linux/_modules/configure-linux.sh

