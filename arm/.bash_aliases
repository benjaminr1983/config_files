# LOCATION: $HOME

# BASH or ZSH shell alieases
# COLOR SUPPORT
if [ -x /usr/bin/dircolors ]; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# LIST COMMAND
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias kernel="uname -r | sed 's/[1-9]\+[0-9]*\.[0-9]\+\.[0-9]\+-//' | sed 's/[1-9]\+[0-9]*\.[0-9]*\-rc[0-9]\+-//'"
alias showip='ip -4 addr show scope global | grep inet | awk "{print $2}" | cut -d"/" -f1 | sed "s/    inet //g" | paste -s -d, -'

# ALERT
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error )" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
