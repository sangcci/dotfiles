# ── Antigravity / Claude helpers ──────────────────────────────────────────────
_dotfiles_prepend_path "$HOME/.antigravity/antigravity/bin"

if [[ "$DOTFILES_OS" == "macos" ]]; then
  alias claude-mem='$HOME/.bun/bin/bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
fi
