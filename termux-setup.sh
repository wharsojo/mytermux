pkg i nano sed curl wget git zsh tmux proot openssh -y

echo "\nInstall oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh
linuxPath="~/linux/ubuntu"
linuxSetup="/root/.ubuntu-setup.sh"
echo "[ -s \"$linuxSetup\" ] && sh $linuxSetup" >> ./ubuntu-fs/root/.bashrc

echo "\nInstall Ubuntu Linux"
mkdir -p $linuxPath && cd $linuxPath
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"
echo "alias ubuntu='(cd $linuxPath && ./start-ubuntu.sh)'" >> ~/.zshrc
echo "tmux new-session -d -s scr" >> ~/.zshrc
echo "sshd" >> ~/.zshrc

echo "apt-get update -y" > ./ubuntu-fs$linuxSetup
echo "apt-get upgrade -y" >> ./ubuntu-fs$linuxSetup
echo "apt-get install nano curl git zsh -y" >> ./ubuntu-fs$linuxSetup
echo "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >> ./ubuntu-fs$linuxSetup
sed -i 's/chsh -s/# chsh -s/g'  ./ubuntu-fs$linuxSetup
echo "rm ~/.ubuntu-setup.sh" >> ./ubuntu-fs$linuxSetup
echo "exit && exit"  >> ./ubuntu-fs$linuxSetup

# source ~/.zshrc

./start-ubuntu.sh
sed -i 's/bash --/zsh --/g' ./start-ubuntu.sh 

exit
