#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Variables
. $HOME/.mytermux/linux/_modules/init-var-colors.sh

## Setup URL for download Linux FS 
URL="https://dl.fedoraproject.org/pub/fedora/linux/releases/29/Container/$(uname -m)/images/"
#file="Fedora-Container-Minimal-Base-29-1.2.$(uname -m).tar.xz"
file="Fedora-Container-Base-29-1.2.$(uname -m).tar.xz"

## Download compressed Linux FS into _cache folder
. $HOME/.mytermux/linux/_modules/download-linux.sh fedora

## Extract Linux file-system
printf "$yellow [*] Extract file-system$reset\n"
tar xvf $file --strip-components=1 --exclude json --exclude VERSION
printf "$blue 2nd extract: layer.tar$reset\n"
tar -xpf layer.tar

## Remove compressed Linux FS
chmod +rwx -R $FS
rm layer.tar
rm $file
cd ..

## Configure linux
. $HOME/.mytermux/linux/_modules/configure-linux.sh

