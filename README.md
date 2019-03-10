# mytermux
my personal configuration of termux

```
$ pkg update 
$ pkg install neovim curl wget git zsh tmux tig proot openssh 
```

access from other pc
```
$ password u0_a384 ## enter the password
```

install oh-my-zsh
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ chsh -s zsh
```

install ubuntu
```
$ mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"

$ nvim ~/.zshrc
alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'
sshd
:q!

# Restart Termux to apply configs
$ ubuntu
$ ln -s  /storage/3637-6263/Android/data/com.termux ~/sdcard

## update start-ubuntu.sh  from bash => zsh
```

install node version manager
```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

$ vim ~/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
:q!

$ nvm install node
$ npm i -g create-react-app
```
