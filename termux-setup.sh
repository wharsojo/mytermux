pkg i nano curl wget git zsh tmux tig proot openssh -y

echo "\nInstall oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s zsh

echo "\nInstall Ubuntu Linux"
mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"
echo "alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'" >> ~/.zshrc
echo "sshd" >> ~/.zshrc

# source ~/.zshrc
exit
