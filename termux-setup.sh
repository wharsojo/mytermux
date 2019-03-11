pkg i nano sed curl wget git zsh tmux tig proot openssh -y

echo "\nInstall oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh

echo "\nInstall Ubuntu Linux"
mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"
echo "alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'" >> ~/.zshrc
echo "sshd" >> ~/.zshrc

echo "apt-get update -y" > ./ubuntu-fs/root/.ubuntu-setup.sh
echo "apt-get upgrade -y" >> ./ubuntu-fs/root/.ubuntu-setup.sh
echo "apt-get install nano curl git zsh -y" >> ./ubuntu-fs/root/.ubuntu-setup.sh
echo "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >> ./ubuntu-fs/root/.ubuntu-setup.sh
echo "rm ~/.ubuntu-setup.sh" >> ./ubuntu-fs/root/.ubuntu-setup.sh
echo "exit && exit"  >> ./ubuntu-fs/root/.ubuntu-setup.sh

echo "[ -s \"/root/.ubuntu-setup.sh\" ] && sh /root/.ubuntu-setup.sh" >> ./ubuntu-fs/root/.bashrc

# source ~/.zshrc

./start-ubuntu.sh
sed -i 's/bash --/zsh --/g' ./start-ubuntu.sh 

exit
