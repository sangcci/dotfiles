# ── Modern CLI aliases ────────────────────────────────────────────────────────
if command -v lsd &>/dev/null; then
  alias ls='lsd'
  alias ll='lsd -l'
  alias lah='lsd -lah'
  alias lt='lsd --tree'
fi

if command -v bat &>/dev/null; then
  alias cat='bat'
elif command -v batcat &>/dev/null; then
  alias cat='batcat'
fi

command -v nvim &>/dev/null && alias n='nvim'
