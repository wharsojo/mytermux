FS="$HOME/.mytermux/linux/alpine/linux-fs"
CC="$HOME/.mytermux/linux/_cache"

## Download compressed Linux FS
printf "$yellow [*] Download: $file ...$reset\n"

mkdir -p $CC && cd $CC
if [ ! -f $file ]; then
   curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file
fi

rm -rf $FS
mkdir -p $FS/binds && cd $FS

ln -s $CC/$file $file

