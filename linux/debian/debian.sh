#!/data/data/com.termux/files/usr/bin/bash -e

URL="http://http.debian.net/debian/pool/main/d/debootstrap"
file=$(wget $URL -qO - | sed 's/<[^>]*>//g' | grep -E '\.[0-9]+\.tar\.gz' | tail -1 | sed  -E 's/[0-9]{4}-.*//')

echo $V
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file
tar xfz $file
