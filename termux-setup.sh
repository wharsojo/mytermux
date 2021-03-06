pkg i vim git sed zsh curl wget tmux proot openssh -y
termux-setup-storage
## Install oh-my-zsh on termux
github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
sh -c "$(curl -fsSL $ohMyZsh)"
chsh -s zsh

## default settings for terux env:
## * tmux detach screen name: scr
echo "export MYTERMUX=$github/wharsojo/mytermux/master" >> ~/.zshenv
echo "tmux new-session -d -s scr" >> ~/.zshenv
## * activate sshd server
echo "sshd" >> ~/.zshenv
## * add alias `ubuntu`
echo "alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'" >> ~/.zshenv

## Install Ubuntu Linux

## create & change current folder 
## run script to install linux fs
myLinux="$github/Neo-Oli/termux-ubuntu/master/ubuntu.sh"
mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu 
sh -c "$(curl -fsSL $myLinux)"

## create a script `.setup-linux.sh` to setup linux
linuxFS="./ubuntu-fs/root/.setup-linux.sh"

## update linux installation and add default packages
echo "apt-get update -y && apt-get upgrade -y" > $linuxFS
echo "apt-get install vim git zsh curl -y" >> $linuxFS

## disable / hide oh-my-zsh prompt1 to checking git dirty status
echo "git config --global --add oh-my-zsh.hide-dirty 1" >> $linuxFS

## Install oh-my-zsh on linux
echo "$(curl -fsSL $ohMyZsh)" >> $linuxFS

## disable shell change
sed -i 's/chsh -s/## chsh -s/g' $linuxFS

## remove installation scripts & exits
echo "rm ~/.setup-linux.sh" >> $linuxFS
echo "exit && exit" >> $linuxFS

# source ~/.zshrc

## if file .setup-linux.sh exists, run with ash shell  
echo "[ -s ./.setup-linux.sh ] && sh ./.setup-linux.sh" >> ./ubuntu-fs/root/.bashrc

## start linux & do the initial setup
./start-ubuntu.sh

## finished setup, change default shell to zsh
sed -i 's/bash --/zsh --/g' ./start-ubuntu.sh 

exit
