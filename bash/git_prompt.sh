#! /bin/bash
# LOCATION /usr/local/share/<dir_name>/<file_name> 
#
## FUNCTION
parse_git_branch() {
  git branch 2>/dev/null | awk '/^\*/ {print " (" $2 ")"}'
}

parse_git_status() {
  local status
  status=$(git status --porcelain 2>/dev/null)
  local staged=0
  local modified=0
  local untracked=0
  local unmerged=0
  local ignored=0

  while read -r line; do
    case "$line" in
      ??*) ((staged++))
      ;;
      M*) ((modified++))
      ;;
      \?\ *) ((untracked++))
      ;;
      U*) ((unmerged++))
      ;;
      \!*) ((ignored++))
      ;;
    esac
    
  done <<< "$status"

  local state=""
  if [[ staged > 0 ]]; then
    state+="*${staged}"
  fi
  if [[ modified > 0 ]]; then
    state+="+${modified}"
  fi
  if [[ untracked > 0 ]]; then
    state+="%${untracked}"
  fi
  if [[ unmerged > 0 ]]; then
    state+="!${unmerged}"
  fi
  if [[ ignored > 0 ]]; then
    state+="^${ignored}"
  fi
  
  echo "$state"
}



update_prompt() {
  if [[ -d .git ]]; then
    local branch
    branch=$(parse_git_branch)
    local gstate
    gstate=$(parse_git_status)
    PROMPT_DIRTRIM=4                                  # shorten deep paths
    PS1='\[\033]0;GIT | BASH v\v | \W\007\]'          # Window title
    PS1="$PS1"'\n'                                    # newline
    PS1="$PS1"'\[\033[30;45m\] [\A]'                  # black text, magenta, 24h time
    PS1="$PS1"'\[\033[30;42m\] \u'                    # black text, green, user
    PS1="$PS1"'\[\033[30;42m\] @\h'                   # black text, green, @host
    PS1="$PS1"'\[\033[30;42m\] \w'                    # black text, green, working directory
    PS1="$PS1"'\[\033[97;46m\]'"$branch"              # white text, cyan
    PS1="$PS1"'\[\033[97;41m\]'"$gstate"              # white text, cyan
    PS1="$PS1"'\[\033[0m\]'                           # change color
    PS1="$PS1"'\n'                                    # new line
    PS1="$PS1"'$ '                                    # prompt always $
  else
    PROMPT_DIRTRIM=4                                  # shorten deep paths
    PS1='\[\033]0;GIT | BASH v\v | \W\007\]'          # Window title
    PS1="$PS1"'\n'                                    # newline
    PS1="$PS1"'\[\033[30;45m\] [\A]'                  # black text, magenta, 24h time
    PS1="$PS1"'\[\033[30;42m\] \u'                    # black text, green, user
    PS1="$PS1"'\[\033[30;42m\] @\h'                   # black text, green, @host
    PS1="$PS1"'\[\033[30;42m\] \w'                    # black text, green, working directory
    PS1="$PS1"'\[\033[0m\]'                           # change color
    PS1="$PS1"'\n'                                    # new line
    PS1="$PS1"'$ '                                    # prompt always $
  fi

}

## PROMPT Setting
PROMPT_COMMAND=update_prompt
## GIT Status
export GIT_PS1_SHOWSTASHSTATE=true                # shows * or + for staged or unstaged changes
export GIT_PS1_SHOWDIRTYSTATE=true                # shows $ for any stashes
export GIT_PS1_SHOWUNTRACKEDFILES=true            # shows % for untracked files
export GIT_PS1_SHOWUPSTREAM="auto"                # shows <,>,<>,= when branch is behind, ahead, diverged from, in sync of upstream branch
