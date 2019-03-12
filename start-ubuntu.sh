#!/data/data/com.termux/files/usr/bin/bash -e
unset LD_PRELOAD


command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r ubuntu-fs"
command+=" -b /dev"
command+=" -b /sys/"
command+=" -b /proc"
command+=" -b /storage/"
command+=" -b /storage/emulated/0:/root/internal"
command+=" -b /storage/3637-6263/Android/data/com.termux:/root/sdcard"
command+=" -r $(pwd)/ubuntu-fs"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin"
command+=" /bin/zsh --login"
exec $command