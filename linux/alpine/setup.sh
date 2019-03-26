#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

## Setup URL for download Linux FS
URL="http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/$(uname -m)"
VER=$(curl -s $URL/latest-releases.yaml | grep -m 1 -o version.* | sed -e 's/[^0-9.]*//g' -e 's/-$//')
if [ -z "$VER" ] ; then
  print "$red [!] Error getting Alpine latest version."
  exit 1
fi
file="alpine-minirootfs-$VER-$(uname -m).tar.gz"
FS="$HOME/.mytermux/linux/alpine/linux-fs"

## Download compressed Linux FS
printf "$yellow [*] Download: $file ...$reset\n"
rm -rf $FS
mkdir -p $FS/binds && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
tar -zxf $file

## Remove compressed Linux FS
rm $file
cd ..

## Configure linux
printf "$yellow [*] Configure linux$reset\n"
echo 'nameserver 8.8.8.8' > $FS/etc/resolv.conf

printf "\n"
