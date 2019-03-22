#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

URL="https://download.java.net/java/GA/jdk12/GPL"
file="openjdk-12_linux-x64_bin.tar.gz"
FS="$HOME/.mytermux/java-vm"

## Download java-vm
printf "$yellow [*] Download: $file ...$reset\n"
rm -rf $FS
mkdir -p $FS && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" 

## Extract java-vm
printf "$yellow [*] Extract java-vm$reset\n"
tar -zxf $file && rm $file

