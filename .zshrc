# ─────────────────────────────────────────────────────────────────────────────
# ENVIRONMENT
# ─────────────────────────────────────────────────────────────────────────────
cd ~
export EDITOR="nvim"
export VISUAL="nvim"
export GPG_TTY=$(tty)
zstyle :compinstall filename '/home/nxstynate/.zshrc'

# ─────────────────────────────────────────────────────────────────────────────
# HISTORY
# ─────────────────────────────────────────────────────────────────────────────

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
setopt HIST_IGNORE_DUPS      # no duplicate entries
setopt HIST_IGNORE_SPACE     # ignore commands starting with space
setopt SHARE_HISTORY         # share history between sessions
setopt APPEND_HISTORY        # append rather than overwrite

# ─────────────────────────────────────────────────────────────────────────────
# VI MODE (like your PSReadLine EditMode Vi)
# ─────────────────────────────────────────────────────────────────────────────
bindkey -v  # vi mode
# In vi *insert* mode, pressing "jk" switches to command (NORMAL) mode
bindkey -M viins 'jk' vi-cmd-mode

export KEYTIMEOUT=15  # optional but fine



# ─────────────────────────────────────────────────────────────────────────────
# COMPLETION
# ─────────────────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Z}' \
    'm:{A-Z}={a-z}' \
    'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*'

# ─────────────────────────────────────────────────────────────────────────────
# FZF (equivalent to PSFzf)
# ─────────────────────────────────────────────────────────────────────────────
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
fi
if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
fi


# fcd - fuzzy cd into directories (like your PowerShell function)
fcd() {
    local dir
    dir=$(find . -type d 2>/dev/null | fzf --query="$1")
    [[ -n "$dir" ]] && cd "$dir"
}

# ─────────────────────────────────────────────────────────────────────────────
# ZOXIDE (like your Invoke-Expression zoxide init)
# ─────────────────────────────────────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ─────────────────────────────────────────────────────────────────────────────
# STARSHIP PROMPT
# ─────────────────────────────────────────────────────────────────────────────
eval "$(starship init zsh)"


# ─────────────────────────────────────────────────────────────────────────────
# ALIASES (translated from PowerShell)
# ─────────────────────────────────────────────────────────────────────────────
alias vim="nvim"
alias cat="bat"
alias g="git"
alias ll="eza -lha"
alias cls="clear"
alias email="neomutt"

# ─────────────────────────────────────────────────────────────────────────────
# UTILITIES
# ─────────────────────────────────────────────────────────────────────────────

# Copy current path to clipboard (WSL)
cptc() {
    pwd | clip.exe
}

# Copy file path to clipboard (WSL)
cpfp() {
    realpath "$1" | clip.exe
}

# ripgrep + fzf into nvim (like your rpgp function)
rpgp() {
    local pattern="$1"
    local dir="${2:-.}"
    local result
    
    result=$(rg --vimgrep --no-heading --color=always --smart-case "$pattern" "$dir" | \
        fzf --ansi --delimiter ":" \
            --preview 'bat --style=numbers --color=always --line-range=:120 {1}' \
            --preview-window=right:70%)
    
    [[ -z "$result" ]] && return
    
    local file=$(echo "$result" | cut -d: -f1)
    local line=$(echo "$result" | cut -d: -f2)
    nvim "+$line" "$file"
}

# ─────────────────────────────────────────────────────────────────────────────
# AUTOSUGGESTIONS & SYNTAX HIGHLIGHTING (Fish-like features you're used to)
# ─────────────────────────────────────────────────────────────────────────────
# Install: pacman -S zsh-autosuggestions zsh-syntax-highlighting

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Suggestion color (like your InlinePrediction = DarkGray)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Accept suggestion with right arrow or Ctrl+f
bindkey '^f' autosuggest-accept
