# mytermux
my personal configuration of termux
```
$ pkg up -y && pkg i curl -y && sh -c "$(curl -fsSL https://raw.githubusercontent.com/wharsojo/mytermux/master/termux-setup.sh)"
$ sed -i 's/ bin\/bash/ bin\/zsh/g' ~/linux/ubuntu/start-ubuntu.sh 
$ echo "alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'" >> ~/linux/ubuntu/start-ubuntu.sh
$ echo "sshd" >> ~/linux/ubuntu/start-ubuntu.sh
```
access from other pc
```
$ password ## enter the password
```
install ubuntu
```
$ mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"

$ nano ~/.zshrc
alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'
sshd
[ctl + x]
```
configure ubuntu with curl, git & oh-my-zsh 
```
# Restart Termux to apply configs
$ ubuntu
$ apt-get update
$ apt-get upgrade
$ apt-get install nano curl git zsh
$ ln -s  /storage/<sdcard-id>/Android/data/com.termux ~/sdcard
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## close ubuntu
## update start-ubuntu.sh  from bash => zsh
$ cd ~/.linux/ubuntu && ./start-ubuntu
## find command+=" /bin/bash --login"  update from bash to zsh
[ctl + x] 
```

install node version manager
```
$ sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

$ nvm install node
$ npm i -g create-react-app
```
