zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# fzf-tab: select item with Tab (Enter executes command after selection)
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'

[ -f "$HOME/.config/fzf/colors.sh" ]     && source "$HOME/.config/fzf/colors.sh"
[ -f "$HOME/.config/fzf/tab-colors.sh" ] && source "$HOME/.config/fzf/tab-colors.sh"
