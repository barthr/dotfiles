source <(fzf --zsh)

fzf-history-widget-multi() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases noglob nobash_rematch 2> /dev/null
  # Ensure the module is loaded if not already, and the required features, such
  # as the associative 'history' array, which maps event numbers to full history
  # lines, are set. Also, make sure Perl is installed for multi-line output.
  if zmodload -F zsh/parameter p:{commands,history} 2>/dev/null && (( ${+commands[perl]} )); then
    selected="$(printf '%s\t%s\000' "${(kv)history[@]}" |
      perl -0 -ne 'if (!$seen{(/^\s*[0-9]+\**\t(.*)/s, $1)}++) { s/\n/\n\t/g; print; }' |
      FZF_DEFAULT_OPTS=$(__fzf_defaults "" "-n2..,.. --scheme=history --bind=ctrl-r:toggle-sort --wrap-sign '\t↳ ' --highlight-line ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m --read0 --multi") \
      FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd))"
  else
    selected="$(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
      FZF_DEFAULT_OPTS=$(__fzf_defaults "" "-n2..,.. --scheme=history --bind=ctrl-r:toggle-sort --wrap-sign '\t↳ ' --highlight-line ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m --multi") \
      FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd))"
  fi
  
  (( ${#selected} )) || return

  # Remove the history number (for example: 800 echo 'test') will become echo 'test'
  cmds=("${(@f)$(printf '%s\n' "${selected[@]}" | awk -F ' ' '{$1=""; sub(/^ +/,""); print}')}")

  # Put them into the editor buffer
  BUFFER="${(j: && :)cmds}"
  CURSOR=${#BUFFER}
  zle reset-prompt
}

zle -N fzf-history-widget # Unbind the fzf standard history widget
zle -N fzf-history-widget-multi # Unbind the fzf multi history widget
bindkey '^R' fzf-history-widget-multi # Bind the multi history widget to ctrl+r
