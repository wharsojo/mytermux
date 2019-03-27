#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Variables
. $HOME/.mytermux/linux/_modules/init-var-colors.sh
. $HOME/.mytermux/linux/_modules/init-var-arch.sh

## Setup URL for download Linux FS
URL="https://partner-images.canonical.com/core/bionic/current/"
file="ubuntu-bionic-core-cloudimg-$arch-root.tar.gz"

## Download compressed Linux FS into _cache folder
. $HOME/.mytermux/linux/_modules/download-linux.sh

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf $file --exclude='dev'||:
chmod +rwx -R $FS

## Remove compressed Linux FS
rm $file
cd ..

## Configure linux
. $HOME/.mytermux/linux/_modules/configure-linux.sh

