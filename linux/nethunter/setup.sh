#!/data/data/com.termux/files/usr/bin/bash -e

_modules="$HOME/.mytermux/linux/_module"s

## Setup Variables
. $_modules/init-var-colors.sh
. $_modules/init-var-arch.sh

## Setup URL for download Linux FS 
URL="https://build.nethunter.com/kalifs/kalifs-latest"
file="kalifs-${arch}-minimal.tar.xz"

## Download compressed Linux FS into _cache folder
. $_modules/download-linux.sh nethunter $*

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf ${file} --exclude='dev' > /dev/null
mv kali-${arch}/* .
rm kali-${arch} -rf
chmod +rwx -R $FS

## Remove compressed Linux FS
chmod +rwx ../linux-fs root
rm $file
cd ..

## Configure linux
. $_modules/configure-linux.sh

