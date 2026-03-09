# ── Navigation ────────────────────────────────────────────────────────────────
alias ~="z ~"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../../"

# ── Core tools (graceful fallback if not installed) ───────────────────────────
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

alias c='clear'
alias mkdir='mkdir -p -v'
alias more='less'
alias lessf='less +F'

# ── System info ───────────────────────────────────────────────────────────────
alias du='du -h -d 1 -x'
alias df='df -h'

# ── Network ───────────────────────────────────────────────────────────────────
alias nsl='netstat -an | grep --color=auto LISTEN'
alias ns='netstat -an'
alias nst='netstat -anp tcp'
alias myip='echo "IPv4(Public): $(curl -4 -s ifconfig.me)\nIPv6(Public): $(curl -6 -s ifconfig.me 2>/dev/null || echo "Not available")"'
alias tracert="traceroute"
alias ping="ping -c 5"

case "$DOTFILES_OS" in
  macos) alias localip='ipconfig getifaddr en0' ;;
  *)     alias localip='hostname -I | awk "{print \$1}"' ;;
esac

# ── Full profile only ─────────────────────────────────────────────────────────
if [[ "$DOTFILES_PROFILE" == "full" ]]; then
  case "$DOTFILES_OS" in
    macos)
      alias claude-mem='$HOME/.bun/bin/bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
      ;;
  esac
fi
