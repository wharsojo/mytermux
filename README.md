# mytermux
My personal / opinionated configuration of termux, Its consist of :

```
$ pkg up -y && pkg i curl -y && sh -c "$(curl -fsSL https://raw.githubusercontent.com/wharsojo/mytermux/master/scripts/install.sh)"

$ pkg up -y && pkg i curl -y && sh -c "$(curl -fsSL https://raw.githubusercontent.com/wharsojo/mytermux/master/termux-setup.sh)"

$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/wharsojo/mytermux/master/linux/alpine/download.sh)"
```
after installation, need to `restart Termux app` and create default password
`passwd` `## enter the password`

##### termux: 
* `vim git sed zsh curl wget tmux proot openssh`
* `oh-my-zsh with default configuration`
* `tmux detach screen name: scr`
* `sshd server - port 8022`

##### Linux

###### alpine
* `vim git zsh curl`
* `oh-my-zsh with default config minus git dirty status`

###### ubuntu
* `vim git zsh curl`
* `oh-my-zsh with default config minus git dirty status`

##### Access from other pc
* `ssh-copy-id <ip> -p 8022`
* `ssh [root@]<ip> -p 8022`


#### Install node version manager
```
$ sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

$ nvm install node
$ npm i -g create-react-app
```

#### License: MIT
