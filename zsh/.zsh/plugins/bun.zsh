# ── Bun ───────────────────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"
_dotfiles_prepend_path "$BUN_INSTALL/bin"
_dotfiles_source_if_exists "$HOME/.bun/_bun"
