zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# fzf-tab: Tab으로 항목 선택 (Enter는 선택 후 명령 실행 방지)
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'

# fzf theme
[ -f "$HOME/.config/fzf/colors.sh" ]     && source "$HOME/.config/fzf/colors.sh"
[ -f "$HOME/.config/fzf/tab-colors.sh" ] && source "$HOME/.config/fzf/tab-colors.sh"
