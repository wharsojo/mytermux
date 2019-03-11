pkg i vim git sed zsh curl wget tmux proot openssh -y

## Install oh-my-zsh on termux
github="https://raw.githubusercontent.com"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
sh -c "$(curl -fsSL $ohMyZsh)"
chsh -s zsh

## Install Ubuntu Linux

## add alias `ubuntu` to termux shell 
echo "alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'" >> ~/.zshrc

## create a new detach tmux screen named: scr  
echo "tmux new-session -d -s scr" >> ~/.zshrc

## activate sshd server
echo "sshd" >> ~/.zshrc

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

## add command to .bashrc: if file .setup-linux.sh exists run with ash shell  
echo "[ -s ./.setup-linux.sh ] && sh ./.setup-linux.sh" >> ./ubuntu-fs/root/.bashrc

## start ubuntu & setup
./start-ubuntu.sh

## finished setup, change default shell to zsh
sed -i 's/bash --/zsh --/g' ./start-ubuntu.sh 

exit
