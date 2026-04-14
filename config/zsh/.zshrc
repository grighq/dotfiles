# Start gui session
[[ -f "$ZDOTDIR/zprofile" ]] && source "$ZDOTDIR/zprofile"

# Secrets
[[ -f "$ZDOTDIR/secrets" ]] && source "$ZDOTDIR/secrets"

# History
HISTFILE="$ZDOTDIR/history"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

# Zsh completion
autoload -Uz compinit
compinit

autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Adguardvpn completions
[[ -s "/opt/adguardvpn_cli/bash-completion.sh" ]] && source '/opt/adguardvpn_cli/bash-completion.sh'

# Bun completions
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# Lazy load for nvm, node, npm
nvm() {
  unset -f nvm node npm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() {
  unset -f nvm node npm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  node "$@"
}
npm() {
  unset -f nvm node npm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  npm "$@"
}

# Pi agent
# Load nvm, if not loading(lazy load, see above) for start pi agent
pi() {
  if [[ -z "$NVM_BIN" ]]; then
    source "$NVM_DIR/nvm.sh"
  fi
  command pi "$@"
}
export PI_CODING_AGENT_DIR="$XDG_CONFIG_HOME/pi"

# Set up fzf key bindings and fuzzy completion
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzfrc"
source <(fzf --zsh)

# Init some utilities
eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"

# Load aliases
source "$ZDOTDIR/aliases"

# Vi mode yank/paste in wayland system clipboard(needed wl-clipboard)
vi-yank-wl-copy() {
  zle vi-yank
  echo -n "$CUTBUFFER" | wl-copy
}
vi-put-after-wl-paste() {
  CUTBUFFER=$(wl-paste -n)
  zle vi-put-after
}
zle -N vi-yank-wl-copy
zle -N vi-put-after-wl-paste
bindkey -M vicmd 'y' vi-yank-wl-copy
bindkey -M vicmd 'p' vi-put-after-wl-paste

# Standart backspace behavior after exit command mode
bindkey -v '^?' backward-delete-char

# Comfortable autosuggest in insert mode
bindkey -M viins '^f' vi-forward-word
bindkey -M viins '^ ' autosuggest-accept

# Ctrl+enter in ghostty
if [[ "$TERM_PROGRAM" == 'ghostty' ]]; then
    bindkey -M viins "^[[27;5;13~" autosuggest-execute
fi

# Plugins
source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'

# Delete duplicates from $PATH
typeset -U PATH
