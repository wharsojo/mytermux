mytermux="/data/data/com.termux/files/home/.mytermux"
scripts="$mytermux/scripts"

env git clone --depth=1 https://github.com/wharsojo/mytermux $mytermux
`$scripts/termux-setup.sh` 
