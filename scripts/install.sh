#!/data/data/com.termux/files/usr/bin/bash -e

mytermux="$HOME/.mytermux"
pkg i git -y
env git clone --depth=1 https://github.com/wharsojo/mytermux $mytermux
##  echo $mytermux/scripts/termux-setup.sh 
(cd $mytermux/scripts && ./termux-setup.sh)

