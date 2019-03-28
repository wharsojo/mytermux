#!/data/data/com.termux/files/usr/bin/bash -e

_modules="$HOME/.mytermux/linux/_modules"

## Setup Colors
. $_modules/init-var-colors.sh

## Setup URL for download Linux FS
URL="http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/$(uname -m)"
VER=$(curl -s $URL/latest-releases.yaml | grep -m 1 -o version.* | sed -e 's/[^0-9.]*//g' -e 's/-$//')
if [ -z "$VER" ] ; then
  print "$red [!] Error getting Alpine latest version."
  exit 1
fi
file="alpine-minirootfs-$VER-$(uname -m).tar.gz"

## Download compressed Linux FS into _cache folder
. $_modules/download-linux.sh alpine $*

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
tar -zxf $file

## Remove compressed Linux FS
rm $file
cd ..

## Configure linux
. $_modules/configure-linux.sh
