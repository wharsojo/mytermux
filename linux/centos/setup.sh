#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Variables
. $HOME/.mytermux/linux/_modules/init-var-colors.sh
. $HOME/.mytermux/linux/_modules/init-var-arch.sh

## Setup URL for download Linux FS 
URL="https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/CentOS/${arch}"
file="centos-rootfs-${arch}.tar.xz"

## Download compressed Linux FS into _cache folder
. $HOME/.mytermux/linux/_modules/download-linux.sh centos

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xJf ${file} --exclude='dev'||:
chmod +rwx -R $FS

## Remove compressed Linux FS
chmod +rwx ../linux-fs root
rm $file
cd ..

## Configure linux
. $HOME/.mytermux/linux/_modules/configure-linux.sh
