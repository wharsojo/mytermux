#!/data/data/com.termux/files/usr/bin/bash -e

_modules="$HOME/.mytermux/linux/_modules"

## Setup Variables
. $_modules/init-var-colors.sh

declare -A archArray=(
[aarch64]=dist-arm64v8
[arm]=dist-arm32v7
[amd64]=dist-i386
[i*86]=dist-amd64
)
arch=${archArray[$(uname -m)]}

## Setup URL for download Linux FS
URL="https://raw.githubusercontent.com/debuerreotype/docker-debian-artifacts/$arch/stretch/slim"
file="rootfs.tar.xz"

## Download compressed Linux FS into _cache folder
. $_modules/download-linux.sh debian $*

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
proot --link2symlink tar -xf $file --exclude='dev' > /dev/null
chmod +rwx -R $FS

## Remove compressed Linux FS
rm $file
cd ..

## Configure linux
. $_modules/configure-linux.sh

