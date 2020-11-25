export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/jetbrains/intelij/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SSH_ASKPASS=ksshaskpass
export PATH=~/.npm-global/bin:$PATH
export EDITOR=vim
export PATH=~/.npm-global/bin:$PATH
export VISUAL=$EDITOR

HISTSIZE=10000                   
SAVEHIST=10000    

source ~/dotfiles/zsh/aliases

autoload -Uz compinit; compinit
_comp_options+=(globdots) 

source ~/dotfiles/zsh/plugins/completion.zsh

fpath=(~/dotfiles/zsh/plugins $fpath)
fpath=(~/dotfiles/zsh/plugins/zsh-completions/src $fpath)

autoload -Uz git.zsh; git.zsh
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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