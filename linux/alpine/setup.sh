#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
. $HOME/.mytermux/linux/_modules/init-var-colors.sh

## Setup URL for download Linux FS
URL="http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/$(uname -m)"
VER=$(curl -s $URL/latest-releases.yaml | grep -m 1 -o version.* | sed -e 's/[^0-9.]*//g' -e 's/-$//')
if [ -z "$VER" ] ; then
  print "$red [!] Error getting Alpine latest version."
  exit 1
fi
file="alpine-minirootfs-$VER-$(uname -m).tar.gz"

## Download compressed Linux FS into _cache folder
. $HOME/.mytermux/linux/_modules/download-linux.sh

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
tar -zxf $file

## Remove compressed Linux FS
rm $file
cd ..

## Configure linux
. $HOME/.mytermux/linux/_modules/configure-linux.sh
