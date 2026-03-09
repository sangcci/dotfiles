# ── fzf integration ───────────────────────────────────────────────────────────
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
elif [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fzf-git
[ -f ~/dotfiles/fzf-git.sh/fzf-git.sh ] && source ~/dotfiles/fzf-git.sh/fzf-git.sh

# ── Key bindings ──────────────────────────────────────────────────────────────
bindkey '^ ' autosuggest-accept      # Ctrl+Space
bindkey '^f' autosuggest-accept      # Ctrl+f (forward)
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
