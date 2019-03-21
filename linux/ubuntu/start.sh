#!/data/data/com.termux/files/usr/bin/bash -e
unset LD_PRELOAD
fs="$HOME/.mytermux/linux/ubuntu/linux-fs"
sdcard=$(ls /storage | grep -E '[0-9]+')
gitea="$HOME/.mytermux/gitea-app"
java="$HOME/.mytermux/java-vm"

## Setup Colors
reset='\033[0m'
red='\033[1;31m'
blue='\033[1;34m'
yellow='\033[1;33m'

command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -b /dev"
command+=" -b /sys"
command+=" -b /proc"
command+=" -b /storage"
command+=" -b /storage/$sdcard/Android/data/com.termux:/root/sdcard"
command+=" -b /storage/emulated/0:/root/internal"

[[ -d $gitea ]] && \
command+=" -b $gitea:/root/gitea-app"

[[ -d $java ]] && \
command+=" -b $java:/root/java-vm"

command+=" -r $fs"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin"
command+=" /bin/bash --login"
echo $command
ver=$(cat $fs/etc/lsb-release | grep DESC | sed -e 's/.*=//' -e 's/"//g')
printf "$yellow [*] Linux is starting: $ver\n$reset"
exec $command
