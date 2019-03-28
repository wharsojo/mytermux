#!/data/data/com.termux/files/usr/bin/bash -e
. $HOME/.mytermux/linux/_modules/init-var-colors.sh
. $HOME/.mytermux/scripts/mtx-info.sh $*

function multiple_commands() {
if [ ! "$COMMAND" == "" ]; then
  printf "$red error multiple commands$reset\n\n"
  exit 1
fi
}

OPTIONS=""
POSITIONAL=()

function install_linux() {
  CMD="$fs/linux/$key/setup.sh $OPTIONS"
  CMD2="~/.mytermux/linux/$key/setup.sh $OPTIONS"
  printf "$yellow [*] $CMD2\n$reset"
  $CMD
  if [[ $OPTIONS == *"--configure"* ]]; then
    echo configure...
    $fs/linux/$key/configure.sh 
  fi
}

while [[ $# -gt 0 ]]; do
  key="$1"
  fs="$HOME/.mytermux"

  case $key in
    -r|--remote)
      OPTIONS+="--remote ";;
    -c|--configure)
      OPTIONS+="--configure ";;
    s|start)
      multiple_commands && COMMAND="start";;
    i|install)
      multiple_commands && COMMAND="install";;
    u|uninstall)
      multiple_commands && COMMAND="uninstall";;
    d|download)
      multiple_commands && COMMAND="download";;
    r|remove)
      multiple_commands && COMMAND="remove";;
    *)
      case $COMMAND in
        start)
	  $fs/linux/$key/start.sh;;
    	install)
          install_linux;;
        uninstall)
	  printf "$red [*] delete $key/linux-fs\n$reset"
	  rm -rf $fs/linux/$key/linux-fs;;
        download)
	  $fs/scripts/$key.sh;;
        remove)
	  printf "$red [*] remove $key"
	  rm -rf $fs/$key;;
      esac;;
  esac
  shift # past value
done
set -- "${POSITIONAL[@]}" # restore positional parameters
printf "\n"
