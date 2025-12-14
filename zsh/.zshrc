#!/bin/zsh

export ZPLUG_HOME=/opt/homebrew/opt/zplug # your os package manager path
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
alias localip='ipconfig getifaddr en0'     # Local IPv4 (WiFi)

alias tracert="traceroute"
alias ping="ping -c 5"

# Shell Integration
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

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

# change the tap title name as opening the shell using wezterm
chpwd() {
  wezterm cli set-tab-title "$(basename "$(pwd)")"
}
wezterm cli set-tab-title $(basename $(pwd))

# Set default editor
export EDITOR='nvim'
export VISUAL='nvim'
export ZVM_VI_EDITOR='nvim'

# Node Path
export PATH="/opt/homebrew/bin/node:$PATH"

# tree-sitter-cli installed by node_modules PATH
export PATH="$HOME/node_modules/tree-sitter-cli/:$PATH"

# Bob Neovim Version Manager
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# SDKMAN_DIR
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# TODO: set location to run python on neovim lsp 
. "$HOME/.local/bin/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
