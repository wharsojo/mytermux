#!/data/data/com.termux/files/usr/bin/bash -e

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'


if [ $# -lt 2 ]; then
   if [ $# -eq 1 ]; then
      printf "$red incomplete [arguments], at least one argument\n\n$reset"
   fi
   printf "$blue"
   printf "mtx	v0.1 \n"
   printf "Use mtx <command> [arguments] \n\n"
   printf "Commands:\n"
   printf "i/install	install linux: alpine centos fedora kali ubuntu\n"
   printf "u/uninstall	uninstall linux: alpine centos fedora kali ubuntu\n"
   printf "d/download	donwload app: gitea\n"
   printf "r/remove	remove app: gitea\n\n"
   printf "Example - i/install:\n"
   printf "* mtx install alpine\n"
   printf "\n"
   printf "Example - d/download:\n"
   printf "* mtx d gitea\n"
   printf "\n"
fi

OPTIONS=""
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"
fs="$HOME/.mytermux"

case $key in
    -c|--compact)
    OPTIONS+="--compact "
    shift # pass options
    ;;
    i|install)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="$key"
    shift # pass value
    ;;
    d|download)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="$key"
    shift # past value
    ;;
    *)
    if [ "$COMMAND" == "" ]; then
       printf "$red error no command issued!$reset\n\n"
       exit 1
    fi
    CMD="$fs/linux/$key/setup.sh $OPTIONS"
    CMD2="~/.mytermux/linux/$key/setup.sh $OPTIONS"
    shift # past value
    printf "$yellow [*] $CMD2\n$reset"
    $CMD
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
printf "\n"