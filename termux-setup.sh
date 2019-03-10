pkg update 
pkg install nano curl wget git zsh tmux tig proot openssh 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh

mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"
echo "alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'" >> ~/.zshrc
echo "sshd" >> ~/.zshrc

source ~/.zshrc

ubuntu
apt-get update
apt-get upgrade
apt-get install nano curl git zsh
ln -s  /storage/<sdcard-id>/Android/data/com.termux ~/sdcard
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
