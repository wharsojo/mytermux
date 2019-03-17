## Download gitea app
URL="https://dl.gitea.io/gitea/1.7.4/gitea-1.7.4-linux-arm64"
FS="$HOME/.mytermux/gitea-app"
file="gitea"

rm -rf $FS
mkdir -p $FS && cd $FS
curl --progress-bar -L --fail --retry 4 -O "$URL/$file" -o $file
chmod +x $file
cd ..

