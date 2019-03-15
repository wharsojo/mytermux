#!/data/data/com.termux/files/usr/bin/bash -e

mytermux="/data/data/com.termux/files/home/.mytermux"
scripts="$mytermux/scripts"

## env git clone --depth=1 https://github.com/wharsojo/mytermux $mytermux
echo $scripts/termux-setup.sh 
`$scripts/termux-setup.sh`

