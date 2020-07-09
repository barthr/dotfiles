# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SSH_ASKPASS=ksshaskpass

export ZSH="$HOME/.oh-my-zsh"
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

alias d=docker
alias dc=docker-compose
alias grep="grep --color=auto"
alias hgrep="history | grep"
alias ccat="highlight -O ansi --"
alias gitb="git for-each-ref --sort=committerdate refs/heads/ --format='%(color: red)%(committerdate:short) %(color: cyan)%(refname:short)'"
alias migration="date '+%Y%m%d%H%M%S'"

export KEYTIMEOUT=1

[ -f ~/Documents/felyx/.secrets.sh ] && . ~/Documents/felyx/.secrets.sh

plugins=(history sudo autojump git golang vi-mode)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Mac
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Linux
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

# Start ssh agent on startup
#eval 
#
if [ $(ps ax | grep ssh-agent | wc -l) -gt 0 ] ; then
		
else
    eval $(ssh-agent -s)
    if [ "$(ssh-add -l)" == "The agent has no identities." ] ; then
        ssh-add < /dev/null
    fi

    # Don't leave extra agents around: kill it on exit. You may not want this part.
    trap "ssh-agent -k" exit
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bart/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bart/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bart/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bart/google-cloud-sdk/completion.zsh.inc'; fi
