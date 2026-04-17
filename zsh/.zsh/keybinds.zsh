# ── fzf integration ───────────────────────────────────────────────────────────
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
elif [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fzf-git
[ -f ~/dotfiles/fzf-git.sh/fzf-git.sh ] && source ~/dotfiles/fzf-git.sh/fzf-git.sh

# ── Key bindings ──────────────────────────────────────────────────────────────
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
