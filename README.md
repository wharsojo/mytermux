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

install linux
```
$ mkdir -p ~/linux/ubuntu && cd ~/linux/ubuntu
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh)"

$ nvim ~/.zshrc
alias ubuntu='(cd ~/linux/ubuntu && ./start-ubuntu.sh)'
sshd
:q!

```