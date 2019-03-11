linuxPath="~/linux/ubuntu"
linuxSetup="/root/.ubuntu-setup.sh"
linuxFsSetup=./ubuntu-fs$linuxSetup
github="https://raw.githubusercontent.com"
myLinux="$github/Neo-Oli/termux-ubuntu/master/ubuntu.sh"
ohMyZsh="$github/robbyrussell/oh-my-zsh/master/tools/install.sh"
pkg i vi git sed zsh curl wget tmux proot openssh -y

echo "\nInstall oh-my-zsh"
sh -c "$(curl -fsSL $ohMyZsh)"
chsh -s zsh

echo "\nInstall Ubuntu Linux"
mkdir -p $linuxPath && cd $linuxPath && sh -c "$(curl -fsSL $myLinux)"
echo "[ -s \"$linuxSetup\" ] && sh $linuxSetup" >> $linuxPath/ubuntu-fs/root/.bashrc

echo "alias ubuntu='(cd $linuxPath && ./start-ubuntu.sh)'" >> ~/.zshrc
echo "tmux new-session -d -s scr" >> ~/.zshrc
echo "sshd" >> ~/.zshrc

echo "apt-get update -y && apt-get upgrade -y" > $linuxFsSetup
echo "apt-get install vi git zsh curl -y" >> $linuxFsSetup
echo "$(curl -fsSL $ohMyZsh)" >> $linuxFsSetup
echo "rm ~/.ubuntu-setup.sh" >> $linuxFsSetup
sed -i 's/chsh -s/# chsh -s/g' $linuxFsSetup
echo "exit && exit" >> $linuxFsSetup

# source ~/.zshrc

./start-ubuntu.sh
sed -i 's/bash --/zsh --/g' ./start-ubuntu.sh 

exit
