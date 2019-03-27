declare -A archArray=(
[aarch64]=arm64
[x86_64]=amd64
[amd64]=amd64
[i*86]=i386
[arm]=armhf
)
arch=${archArray[$(uname -m)]}
