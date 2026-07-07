# ── zoxide ────────────────────────────────────────────────────────────────────
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"

  alias ~='z ~'
  alias ..='z ..'
  alias ...='z ../..'
  alias ....='z ../../../'
else
  alias ~='cd ~'
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../../'
fi
