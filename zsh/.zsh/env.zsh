# ── Editor ────────────────────────────────────────────────────────────────────
export EDITOR='nvim'
export VISUAL='nvim'

# ── Shell Integrations ────────────────────────────────────────────────────────
# zoxide (smart cd) - must be after path.zsh
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
DISABLE_AUTO_TITLE="true"

# ── Full profile only ─────────────────────────────────────────────────────────
if [[ "$DOTFILES_PROFILE" == "full" ]]; then
  # SDKMAN
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

  # uv python manager
  [ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

  # envman
  [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

  # bun completions
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
fi
