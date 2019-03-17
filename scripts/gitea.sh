#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

URL="https://dl.gitea.io/gitea/1.7.4"
file="gitea-1.7.4-linux-arm64"
FS="$HOME/.mytermux/gitea-app"

## Download gitea app
printf "$yellow [*] Download: $file ...$reset\n"
rm -rf $FS
mkdir -p $FS && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" 
mv $file 'gitea'
chmod +x 'gitea'
cd ..
