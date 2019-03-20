My personal / opinionated configuration of [Termux](https://play.google.com/store/apps/details?id=com.termux), an attempt to make `Termux` easier to work to, either in `Termux` or *Linux inside* `Termux` with default same `Terminal applications`. Tested on Samsung Galaxy Note9.

## Installation
`My Termux` is installed by running the following commands in your terminal:

```
$ pkg up && pkg i curl && curl -fsSL https://raw.githubusercontent.com/wharsojo/mytermux/master/scripts/install.sh | sh
```
after installation, need to `restart Termux` and create default password
```
$ passwd  ## enter the `password`
```

#### Termux: 
These are the default Configs of `Termux`
* `vim git sed zsh curl wget tmux proot openssh`
* `oh-my-zsh with default configuration`
* `tmux detach screen name: scr`
* `sshd server - port 8022`

Aliases to setup and start *Linux inside* `Termux` 
```
* setup-alpine
* setup-centos
* setup-ubuntu
* start-alpine
* start-centos
* start-ubuntu
```

#### Linux
Default Configs for Linux (`Centos`, `Ubuntu`)
* `vim git zsh curl`
* `oh-my-zsh minus git dirty status`

Alpine linux right now having error: ERROR: busybox-1.29.3-r10.trigger: script exited with error 127, no work-around can be apply for this error, Appriciated if anyone can help.

#### Access from other pc
```
* ssh-copy-id <ip> -p 8022
* ssh [root@]<ip> -p 8022
```

#### Install node version manager
```
$ sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

$ nvm install node
$ npm i -g create-react-app
```

#### License: MIT
