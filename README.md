My personal / opinionated configuration of [Termux](https://play.google.com/store/apps/details?id=com.termux), an attempt to make `Termux` easier to work to, either in `Termux` or *Linux inside* `Termux` with default same `Terminal applications`. Tested on Samsung Galaxy Note9.

## Installation
`My Termux` is installed by running the following commands in your terminal:

```
$ pkg up && pkg i curl && curl -fsSL https://raw.githubusercontent.com/wharsojo/mytermux/master/scripts/install.sh | sh
```
after installation, need to create default password and exit/restart Termux` 
```
$ passwd  ## enter the `password`
$ exit ## exit from Termux
```

#### Termux: 
These are the default Configs of `Termux`
* `vim git sed zsh curl wget tmux proot openssh`
* `oh-my-zsh with default configuration`
* `tmux detach screen name: scr`
* `sshd server - port 8022`

To setup and start *Linux inside* `Termux`, there is a script called `mtx` stands for (m)y (t)termu(x), several linux distro are avalable: `alpine debian centos fedora kali nethunter ubuntu`
```
➜  ~ mtx
mtx     v0.1.6
Use mtx [options] <command> [arguments]

Commands:
i/install       alpine debian centos fedora kali nethunter ubuntu
u/uninstall     alpine
s/start         alpine
d/download      gitea
r/remove        gitea

Example - i/install:
* mtx install alpine
* mtx -c i centos

Example - d/download:
* mtx d gitea
```

#### Linux
When installing linux with `options -c` the default Configs for Linux (`Centos`, `Fedora`, `Kali`, `nethunter`,`Ubuntu`)
* `vim git zsh curl`
* `oh-my-zsh minus git dirty status`

`Alpine` linux right now having error: ERROR: busybox-1.29.3-r10.trigger: script exited with error 127, no work-around can be apply for this error, Appriciated if anyone can help.

`Centos/Fedora` linux on AndroidOne, the installation is having problem with symlink, will failed to install correctly, Appriciated if anyone can help. for Samsung Note9 is fine. 

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
