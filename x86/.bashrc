# LOCATION: $HOME 

# CHECK INTERACTIVE SHELL
case $- in
    *i*) ;;
      *) return;;
esac

# BASIC CONFIG
HISTCONTROL=ignoreboth			    # ignores whitespaces and duplicates
HISTSIZE=1000				    # max number of commands in memory during a session
HISTFILESIZE=2000			    # max number of saved commands to a session
color_prompt=true			    # enables colored output

# optional SHELL Behaviour
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# COLOR SETUP
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# ALIAS LOADING
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# LC-SETTINGS
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

# RUST Environment
. "$HOME/.cargo/env"

# GIT Setup
if [[ -f /usr/local/share/bash/git_prompt.sh ]]; then
	. /usr/local/share/bash/git_prompt.sh
fi

# SSH_AUTH_SOCK
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
