export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:~/go/bin
export PATH=$PATH:/opt/jetbrains/intelij/bin
export PATH=$PATH:~/home/bart/Downloads/flutter
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=~/.npm-global/bin:$PATH
export EDITOR=nvim
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:"$HOME/.cargo/env"
export PATH=$PATH:"$HOME/.local/share/zig-14.0/"
export PATH=$PATH:~/dotfiles/scripts
export PATH=$PATH:~/.fzf/bin/
export GOSUMDB=sum.golang.org
export GOROOT=~/go
export GOPATH=~/go/bin
export PATH=$PATH:~/nvim/bin
export PATH=$PATH:~/.luarocks/bin

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

export DOCKER_BUILDKIT=1

## FLY.IO
export FLYCTL_INSTALL="/home/bart/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

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

autoload -Uz compinit
# Smarter completion initialization
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi
_comp_options+=(globdots) 

source ~/dotfiles/zsh/plugins/completion.zsh

fpath=(~/dotfiles/zsh/plugins $fpath)
fpath=(~/dotfiles/zsh/plugins/zsh-completions/src $fpath)

# ZSH autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

autoload -Uz git.zsh; git.zsh
autoload -Uz edit-command-line
zle -N edit-command-line

# Fix weird keybindings
bindkey "^[[1;5C"  forward-word
bindkey "^[[1;5D"  backward-word
bindkey  "^[[H"    beginning-of-line
bindkey  "^[[F"    end-of-line
bindkey  "^[[3~"   delete-char
bindkey  "\C-h"    backward-kill-word
bindkey  "\e[3;5~" kill-word

# bindkey -v
export KEYTIMEOUT=1

setopt AUTO_PUSHD           
setopt PUSHD_IGNORE_DUPS    
setopt PUSHD_SILENT         

[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_PREFIX=' '
SPACESHIP_DIR_PREFIX=' '
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

fpath=($fpath "/home/bart/.zfunctions")
source ~/dotfiles/zsh/themes/spaceship-prompt/spaceship.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vim=nvim
alias "c=xclip"
alias "v=xclip -o"

# Enable multi history widget
source ~/dotfiles/zsh/fzf.zsh

# Mise installation
eval "$(/home/bart/.local/bin/mise activate zsh)"
eval "$(mise activate zsh --shims)"
