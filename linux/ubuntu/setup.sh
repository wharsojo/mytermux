#!/data/data/com.termux/files/usr/bin/bash -e

_modules="$HOME/.mytermux/linux/_modules"

## Setup Variables
. $_modules/init-var-colors.sh
. $_modules/init-var-arch.sh

## Setup URL for download Linux FS
URL="https://partner-images.canonical.com/core/bionic/current/"
file="ubuntu-bionic-core-cloudimg-$arch-root.tar.gz"

## Download compressed Linux FS into _cache folder
. $_modules/download-linux.sh ubuntu $*

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -vxf $file --exclude='dev' > /dev/null
chmod +rwx -R $FS

## Remove compressed Linux FS
rm $file
cd ..

## Configure linux
. $_modules/configure-linux.sh

