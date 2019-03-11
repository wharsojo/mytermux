linuxTermux=~/linux/ubuntu
linuxFSetup=.ubuntu-setup.sh
linuxFSystem=$linuxTermux/ubuntu-fs/root/$linuxFSetup

github=https://raw.githubusercontent.com
myLinux=$github/Neo-Oli/termux-ubuntu/master/ubuntu.sh
ohMyZsh=$github/robbyrussell/oh-my-zsh/master/tools/install.sh

pkg i vim git sed zsh curl wget tmux proot openssh -y

echo "\nInstall oh-my-zsh"
sh -c "$(curl -fsSL $ohMyZsh)"
chsh -s zsh

echo "\nInstall Ubuntu Linux"
mkdir -p $linuxTermux && cd $linuxTermux && sh -c "$(curl -fsSL $myLinux)"

echo "alias ubuntu='(cd $linuxTermux && ./start-ubuntu.sh)'" >> ~/.zshrc
echo "tmux new-session -d -s scr" >> ~/.zshrc
echo "sshd" >> ~/.zshrc

echo "[ -s ./$linuxFSetup ] && sh ./$linuxFSetup" >> ./ubuntu-fs/root/.bashrc
echo "apt-get update -y && apt-get upgrade -y" > $linuxFSystem
echo "apt-get install vim git zsh curl -y" >> $linuxFSystem
echo "$(curl -fsSL $ohMyZsh)" >> $linuxFSystem
sed -i 's/chsh -s/## chsh -s/g' $linuxFSystem
echo "rm ~/.ubuntu-setup.sh" >> $linuxFSystem
echo "exit && exit" >> $linuxFSystem

# source ~/.zshrc

./start-ubuntu.sh
sed -i 's/bash --/zsh --/g' ./start-ubuntu.sh 

exit
