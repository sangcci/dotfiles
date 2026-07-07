# ── fzf ───────────────────────────────────────────────────────────────────────
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
else
  _dotfiles_source_if_exists "$HOME/.fzf.zsh"
fi

# fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'

_dotfiles_source_if_exists "$HOME/.config/fzf/colors.sh"
_dotfiles_source_if_exists "$HOME/.config/fzf/tab-colors.sh"
