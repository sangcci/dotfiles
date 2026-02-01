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
zplug "olets/zsh-transient-prompt"

zplug "plugins/git", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Pure enhanced with transient prompt
TRANSIENT_PROMPT_PROMPT=$'%F{${prompt_pure_colors[path]}}%~%f\n%{\C-M%}%(12V.%F{$prompt_pure_colors[virtualenv]}%12v%f .)%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]}%f '
TRANSIENT_PROMPT_TRANSIENT_PROMPT='%(12V.%F{$prompt_pure_colors[virtualenv]}%12v%f .)%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]} %f'

# fzf integration
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
elif [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fzf-git.sh integration
[ -f ~/dotfiles/fzf-git.sh/fzf-git.sh ] && source ~/dotfiles/fzf-git.sh/fzf-git.sh

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
alias cat='bat'
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

# fzf theme source
if [ -f "$HOME/.config/fzf/colors.sh" ]; then
    source "$HOME/.config/fzf/colors.sh"
fi

# fzf-tab colors
if [ -f "$HOME/.config/fzf/tab-colors.sh" ]; then
    source "$HOME/.config/fzf/tab-colors.sh"
fi

# Set default editor
export EDITOR='nvim'
export VISUAL='nvim'

# node.js - OS-specific paths
if [[ "$(uname -s)" == "Darwin" ]]; then
    export PATH="/opt/homebrew/bin/node:$PATH"
else
    export PATH="/usr/bin/node:$PATH"
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Shell Integration

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

# JLS
# export JAVA_LSP_HOST_JAVA="$HOME/.sdkman/candidates/java/25.0.1-tem/bin/java"

# uv python manager
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# fetch
nerdfetch
