mytermux="/data/data/com.termux/files/home/.mytermux"
scripts="$mytermux/scripts"

env git clone --depth=1 https://github.com/wharsojo/mytermux $mytermux
cat $scripts/termux-setup.sh | sh
