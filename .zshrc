export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:~/go/bin
export PATH=$PATH:/opt/jetbrains/intelij/bin
export PATH=$PATH:~/Flutter/flutter/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SSH_ASKPASS=ksshaskpass
export PATH=~/.npm-global/bin:$PATH
export EDITOR=vim
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:/home/bart/.rbenv/bin
export PATH=$PATH:"$HOME/.cargo/env"

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-17.0.4.1.1-1.fc36.x86_64"

## DENO
export DENO_INSTALL="/home/bart/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
## END DENO

## FLY.IO
export FLYCTL_INSTALL="/home/bart/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
##
#
# VAGRANT
## NPM
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
## END NPM

export HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

alias python3="/usr/bin/python3.9"

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
source ~/dotfiles/zsh/aliases

source "$(redo alias-file)"

autoload -Uz compinit; compinit
_comp_options+=(globdots) 

source ~/dotfiles/zsh/plugins/completion.zsh

fpath=(~/dotfiles/zsh/plugins $fpath)
fpath=(~/dotfiles/zsh/plugins/zsh-completions/src $fpath)

# ZSH autosuggestions
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

autoload -Uz git.zsh; git.zsh
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -s '^e' 'redo^M'

# fix keys
bindkey '^[[3~' delete-char 

# bindkey -v
export KEYTIMEOUT=1

setopt AUTO_PUSHD           
setopt PUSHD_IGNORE_DUPS    
setopt PUSHD_SILENT         

# Linux
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_PREFIX=' '
SPACESHIP_DIR_PREFIX=' '
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

fpath=($fpath "/home/bart/.zfunctions")
autoload -U promptinit; promptinit
prompt spaceship

source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vim=nvim
# manage dotfiles
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"


## AUTOCOMPLETE TLDR
