#!/data/data/com.termux/files/usr/bin/bash -e
. $HOME/.mytermux/linux/_modules/init-var-colors.sh
. $HOME/.mytermux/scripts/mtx-info.sh $*

OPTIONS=""
POSITIONAL=()
fs="$HOME/.mytermux"

function no_command() {
if [ ! "$COMMAND" == "" ]; then
  printf "$red error multiple commands$reset\n\n"
  exit 1
fi
}

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

function uninstall_linux() {
  printf "$red [*] delete $key/linux-fs\n$reset"
  rm -rf $fs/linux/$key/linux-fs
}

function remove_app() {
  printf "$red [*] remove $key"
  rm -rf $fs/$key
}

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -r|--remote)    OPTIONS+="--remote ";;
    -c|--configure) OPTIONS+="--configure ";;
    s|start)        no_command && COMMAND="start";;
    i|install)      no_command && COMMAND="install";;
    u|uninstall)    no_command && COMMAND="uninstall";;
    d|download)     no_command && COMMAND="download";;
    r|remove)       no_command && COMMAND="remove";;
    *)
      case $COMMAND in
        start)      $fs/linux/$key/start.sh;;
    	install)    install_linux;;
        uninstall)  uninstall_linux;;
        download)   $fs/scripts/$key.sh;;
        remove)     remove_app;;
      esac;;
  esac
  shift # past value
done

set -- "${POSITIONAL[@]}" # restore positional parameters
printf "\n"
