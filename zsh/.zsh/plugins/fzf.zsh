# ── fzf ───────────────────────────────────────────────────────────────────────
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
else
  _dotfiles_source_if_exists "$HOME/.fzf.zsh"
fi

_dotfiles_source_if_exists "$HOME/.config/fzf/colors.sh"
