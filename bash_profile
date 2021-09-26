#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc 

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash/git_prompt/gitprompt.sh
GIT_PROMPT_FETCH_REMOTE_STATUS=0        # avoid fetching remote status
GIT_PROMPT_THEME=Solarized_UserHost     # better theme
GIT_PROMPT_IGNORE_STASH=1               # ignore any stashes
