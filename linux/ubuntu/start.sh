#!/data/data/com.termux/files/usr/bin/bash -e
unset LD_PRELOAD
fs="$HOME/.mytermux/linux/ubuntu/linux-fs"
sdcard=$(ls /storage | grep -E '[0-9]+')
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -b /dev"
command+=" -b /sys"
command+=" -b /proc"
command+=" -b /storage"
command+=" -b /storage/emulated/0:/root/internal"
command+=" -b /storage/$sdcard/Android/data/com.termux:/root/sdcard"
command+=" -r $fs"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin"
command+=" /bin/bash --login"
exec $command
