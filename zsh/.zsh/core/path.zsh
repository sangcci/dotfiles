# ── Common ────────────────────────────────────────────────────────────────────
_dotfiles_prepend_path "$HOME/.local/bin"
_dotfiles_prepend_path "$HOME/.cargo/bin"
_dotfiles_prepend_path "$HOME/.local/share/bob/nvim-bin"

# ── OS-specific base paths ────────────────────────────────────────────────────
case "$DOTFILES_OS" in
  macos)
    _dotfiles_prepend_path "/opt/homebrew/bin"
    ;;
esac
