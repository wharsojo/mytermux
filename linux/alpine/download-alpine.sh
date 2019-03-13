#!/data/data/com.termux/files/usr/bin/bash -e

# colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

URL="http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/$(uname -m)"
VER=$(curl -s $URL/latest-releases.yaml | grep -m 1 -o version.* | sed -e 's/[^0-9.]*//g' -e 's/-$//')
if [ -z "$VER" ] ; then
  print "$red [!] Erro getting Alpine latest version."
  exit 1
fi

URL="$URL/alpine-minirootfs-$VER-$(uname -m).tar.gz"
FS="alpine-fs"

printf "$blue [*] Download:$URL ...$reset\n"
curl --progress-bar -L --fail --retry 4 -o $FS.tar.gz -O "$URL"

printf "$yellow [*] Extract file-system ...$reset\n"
mkdir -p $FS && cd $FS
proot --link2symlink -0 bsdtar -xpf ../$FS.tar.gz
cd ..
## tar -zxf $FS.tar.gz -C $FS
rm $FS.tar.gz
