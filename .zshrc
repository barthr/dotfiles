# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/jetbrains/intelij/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SSH_ASKPASS=ksshaskpass
export PATH=~/.npm-global/bin:$PATH
export EDITOR=vim
export VISUAL=$EDITOR
export HISTFILE="$HOME/.config/zsh/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000    
ZSH_THEME="robbyrussell"

source ~/dotfiles/zsh/aliases

autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files

source ~/dotfiles/zsh/plugins/completion.zsh

fpath=(~/dotfiles/zsh/prompt $fpath)
autoload -Uz prompt.zsh; prompt.zsh

export KEYTIMEOUT=1

# plugins=(history sudo autojump git golang vi-mode)

# source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Mac
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Linux
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bart/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bart/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/bart/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bart/google-cloud-sdk/completion.zsh.inc'; fi
