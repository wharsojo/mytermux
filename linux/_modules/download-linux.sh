FS="$HOME/.mytermux/linux/$1/linux-fs"
X1="$HOME/storage/external-1"

## Download compressed Linux FS
if [[ ! -d $X1 ]]; then
  MSG="$yellow [*] Download: $file ...$reset\n"
  CC="$HOME/.mytermux/linux/_cache"
else
  MSG="$yellow [*] Download: $red$file ...$reset\n"
  CC="$X1/.mytermux/linux/_cache"
fi

#printf "$green params: $*\n"

mkdir -p $CC && cd $CC

if [[ $* == *"--remote"* ]] && [[ -f $file ]]; then
   rm $file
fi

if [[ ! -f $file ]]; then
   printf "$MSG"
   curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file
fi

rm -rf $FS
mkdir -p $FS/binds && cd $FS

ln -s $CC/$file $file

