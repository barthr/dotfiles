export PATH="$HOME/.local/bin:$PATH"
export GOPATH="${GOPATH:-$HOME/go}"
export PATH="$PATH:$GOPATH/bin"
[[ -d /opt/jetbrains/intelij/bin ]] && export PATH="$PATH:/opt/jetbrains/intelij/bin"
[[ -d "$HOME/Downloads/flutter/bin" ]] && export PATH="$PATH:$HOME/Downloads/flutter/bin"
export LANG=en_US.UTF-8
export EDITOR=nvim
export GOSUMDB=sum.golang.org
export PATH="$PATH:$HOME/.luarocks/bin"

typeset -g DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
export PATH="$PATH:$DOTFILES_DIR/scripts"

# rustup configures the toolchain and adds Cargo's bin directory to PATH.
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

export DOCKER_BUILDKIT=1

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
if (( $+commands[manpath] )); then
    export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
fi
## END NPM

export HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

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

bindkey '^ ' autosuggest-accept

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

fpath=($fpath "$HOME/.zfunctions")

alias vim=nvim
alias "c=xclip"
alias "v=xclip -o"

# Enable multi history widget
source "$DOTFILES_DIR/zsh/fzf.zsh"

# Mise installation
if (( $+commands[mise] )); then
    eval "$(mise activate zsh)"
fi
