#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# different PS1 for root and user
if [[ $(id -u) -eq 0 ]];then
    # PS1 for root
    PS1='\[\e[1;32m\][\@]\[\e[1;37m\][\u@\h]\[\e[1;36m\][\w]\n \[\e[32m\][>_] \] \e[0;31m\]'
else
    # PS1 for normal users
    PS1='\[\e[1;36m\][\@]\[\e[1;35m\][\u@\h]\[\e[1;32m\][\w]\n \[\e[1;34m\][>_] \] \e[0;33m\]'
fi
## Basic Settings
#  standard editor
export EDITOR='vim'
export VISUAL='vim'
# Language
export LANGUAGE="en_GB:en"
#  alias
if [ -f ~/.bash_alias ];
then . ~/.bash_alias
fi
#  function
if [ -f ~/.bash_function ];
then . ~/.bash_function
fi
#  window_sizing
shopt -s checkwinsize

## History
#  don't put duplicates in the history an delete existing duplicates
#  don't put anything in history that starts with a space
export HISTCONTROL="erasedups":"ignorespace"
#  apend to the history file, do'nt overwrite it
shopt -s histappend
#  historylength
HISTSIZE=1000
HISTFILESIZE=2000
# ssh_agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


## sway
#if [ "$(tty)" = "/dev/tty1" ]; then
#       exec dbus-run-session sway	
#fi
## go_path
# goroot_dir
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin
# go_path_global
export GOPATH=$HOME/golib
export PATH=$PATH:/$GOPATH/bin
# go_path_workstation
export GOPATH=$GOPATH:$HOME/ws

