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
   printf "Use mtx [options] <command> [arguments] \n\n"
   printf "Commands:\n"
   printf "i/install	alpine debian centos fedora kali ubuntu\n"
   printf "u/uninstall	alpine debian centos fedora kali ubuntu\n"
   printf "s/start    	alpine\n"
   printf "d/download	gitea\n"
   printf "r/remove	gitea\n\n"
   printf "Example - i/install:\n"
   printf "* mtx install alpine\n"
   printf "* mtx -c i centos\n"
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
    -r|--remote)
    OPTIONS+="--remote "
    shift # pass options
    ;;
    -c|--configure)
    OPTIONS+="--configure "
    shift # pass options
    ;;
    i|install)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="install"
    shift # pass value
    ;;
    s|start)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="start"
    shift # pass value
    ;;
    u|uninstall)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="uninstall"
    shift # pass value
    ;;
    r|remove)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="remove"
    shift # pass value
    ;;
    d|download)
    if [ ! "$COMMAND" == "" ]; then
       printf "$red error multiple commands$reset\n\n"
       exit 1
    fi
    COMMAND="download"
    shift # past value
    ;;
    *)
    case $COMMAND in
    	install)
    	CMD="$fs/linux/$key/setup.sh $OPTIONS"
    	CMD2="~/.mytermux/linux/$key/setup.sh $OPTIONS"
    	printf "$yellow [*] $CMD2\n$reset"
    	$CMD
    	if [[ $OPTIONS == *"--configure"* ]]; then
       	   echo configure...
           $fs/linux/$key/configure.sh 
        fi
	;;
        start)
	$fs/linux/$key/start.sh
	;;
        remove)
	printf "$red [*] remove $key"
	rm -rf $fs/$key
	;;
        uninstall)
	printf "$red [*] delete $key/linux-fs\n$reset"
	rm -rf $fs/linux/$key/linux-fs
	;;
    esac
    shift # past value
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
printf "\n"
