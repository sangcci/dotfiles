#!/bin/zsh

# zplug configuration - detect OS and set correct path
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS - using Homebrew
    export ZPLUG_HOME="/opt/homebrew/opt/zplug"
else
    # Linux/Debian - using local installation
    export ZPLUG_HOME="$HOME/.zplug"
fi

source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "Aloxaf/fzf-tab", from:github
zplug "jeffreytse/zsh-vi-mode"

zplug "plugins/git", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

zplug load

# key binding
bindkey '^ ' autosuggest-accept      # Ctrl+Space
bindkey '^f' autosuggest-accept      # Ctrl+f (forward)
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

# aliases
alias ~="z ~"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../../"
alias ls='lsd'
alias ll='lsd -l'
alias lah='lsd -lah'
alias lt='lsd --tree'
alias mkdir='mkdir -p -v'
alias n='nvim'
alias c='clear' 
alias more='less'

alias lessf='less +F'

alias du='du -h -d 1 -x'	# Human-readable sizes
alias df='df -h'			# Human-readable disk sizes

alias nsl='netstat -an | grep --color=auto LISTEN'
alias ns='netstat -an'
alias nst='netstat -anp tcp'

alias myip='echo "IPv4(Public): $(curl -4 -s ifconfig.me)\nIPv6(Public): $(curl -6 -s ifconfig.me 2>/dev/null || echo "Not available")"'

# OS-specific localip alias
if [[ "$(uname -s)" == "Darwin" ]]; then
    alias localip='ipconfig getifaddr en0'     # Local IPv4 (WiFi - macOS)
else
    alias localip='hostname -I | awk "{print \$1}"'  # Local IPv4 (Debian/Linux)
fi

alias tracert="traceroute"
alias ping="ping -c 5"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY              # Share history across sessions
setopt HIST_IGNORE_ALL_DUPS       # Remove older duplicate entries
setopt HIST_FIND_NO_DUPS          # Don't show duplicates in search
setopt HIST_REDUCE_BLANKS         # Remove extra blanks
setopt INC_APPEND_HISTORY         # Add commands immediately

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Forcing the Prompt to the Bottom
end=$(tput cup 9999 0)
PROMPT="%{${end}%}> "

# change the tab title name as opening the shell using wezterm (macOS only)
# if command -v wezterm &> /dev/null; then
#   chpwd() {
#     wezterm cli set-tab-title "$(basename "$(pwd)")"
#   }
#   wezterm cli set-tab-title $(basename $(pwd))
# fi

# fzf Kanagawa Dragon theme
if command -v fzf &> /dev/null; then
  export FZF_DEFAULT_OPTS="
  --color=fg:#c5c9c5,fg+:#c5c9c5,bg:#181616,bg+:#282727
  --color=hl:#87a987,hl+:#87a987,info:#c4b28a,marker:#c4746e
  --color=prompt:#c4746e,spinner:#8992a7,pointer:#c4746e,header:#949fb5
  --color=border:#393836,gutter:#181616,query:#c5c9c5"
fi

# fzf-tab Kanagawa Dragon theme
zstyle ':fzf-tab:*' fzf-flags \
  --color=fg:#c5c9c5,fg+:#c5c9c5,bg:#181616,bg+:#282727 \
  --color=hl:#87a987,hl+:#87a987,info:#c4b28a,marker:#c4746e \
  --color=prompt:#c4746e,spinner:#8992a7,pointer:#c4746e,header:#949fb5 \
  --color=border:#393836,gutter:#181616

# Set default editor
export EDITOR='nvim'
export VISUAL='nvim'
export ZVM_VI_EDITOR='nvim'

# node.js - OS-specific paths
if [[ "$(uname -s)" == "Darwin" ]]; then
    export PATH="/opt/homebrew/bin/node:$PATH"
else
    export PATH="/usr/bin/node:$PATH"
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Shell Integration
# fzf - fuzzy finder
if command -v fzf &> /dev/null; then
	eval "$(fzf --zsh)"
elif [ -f ~/.fzf.zsh ]; then
	source ~/.fzf.zsh
fi

# zoxide - smart cd
# NOTE: it should be after registering local bin path
eval "$(zoxide init zsh)"

# Rust cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

# tree-sitter-cli installed by npm global
export PATH="$(npm config get prefix)/bin:$PATH"

# Bob Neovim Version Manager
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# SDKMAN_DIR
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# uv python manager
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
