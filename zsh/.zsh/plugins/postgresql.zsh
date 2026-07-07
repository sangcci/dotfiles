# ── PostgreSQL ────────────────────────────────────────────────────────────────
if [[ "$DOTFILES_OS" == "macos" ]] && command -v brew &>/dev/null; then
  postgresql_prefix="$(brew --prefix postgresql@16 2>/dev/null)"
  [[ -n "$postgresql_prefix" ]] && _dotfiles_prepend_path "$postgresql_prefix/bin"
  unset postgresql_prefix
fi
