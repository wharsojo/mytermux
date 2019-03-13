#!bash -e
echo $(uname -m)
if [ $(uname -m)="aarch64" ]; then
  typ="arm linux"
fi

echo $typ
echo "SDCARD: [$(ls /storage | grep -E '[0-9]+')]"