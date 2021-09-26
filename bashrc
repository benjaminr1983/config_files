#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[31m[\t] \[\e[35m\[\e[1m\][\w]\] $\n \[\e[93m\u@\h \[\e[92m\[\e[1m\]>>>  \]\[\e[0m\]'

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
#  don't put duplicates in the history
HISTCONTROL=ignoreboth
#  apend to the history file, do'nt overwrite it
shopt -s histappend
#  historylength
HISTSIZE=1000
HISTFILESIZE=2000
