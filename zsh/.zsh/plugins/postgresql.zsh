# ── PostgreSQL ────────────────────────────────────────────────────────────────
if [[ "$DOTFILES_OS" == "macos" ]] && command -v brew &>/dev/null; then
  # postgresql@16은 서버까지, libpq는 psql 같은 클라이언트 도구만 설치한다. 둘 다 keg-only라 PATH에 직접 넣는다.
  for postgresql_formula in libpq postgresql@16; do
    postgresql_prefix="$(brew --prefix "$postgresql_formula" 2>/dev/null)"
    [[ -n "$postgresql_prefix" ]] && _dotfiles_prepend_path "$postgresql_prefix/bin"
  done
  unset postgresql_formula postgresql_prefix
fi
