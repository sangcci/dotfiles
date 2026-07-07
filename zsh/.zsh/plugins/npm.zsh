# ── npm global binaries ───────────────────────────────────────────────────────
if command -v npm &>/dev/null; then
  npm_prefix="$(npm config get prefix 2>/dev/null)"
  [[ -n "$npm_prefix" ]] && _dotfiles_prepend_path "$npm_prefix/bin"
  unset npm_prefix
fi
