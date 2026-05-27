# ── Editor ────────────────────────────────────────────────────────────────────
export EDITOR='nvim'
export VISUAL='nvim'

# ── Shell Integrations ────────────────────────────────────────────────────────
# zoxide (smart cd) - must be after path.zsh
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
DISABLE_AUTO_TITLE="true"

# ── Docker / Testcontainers ───────────────────────────────────────────────────
# Docker CLI can resolve the active context, but JVM tools such as Testcontainers
# often probe /var/run/docker.sock first. On macOS + Colima that socket may not
# exist, so point them at Colima's Unix socket without overriding explicit user
# configuration.
if [[ "$DOTFILES_OS" == "macos" && -z "$DOCKER_HOST" && -S "$HOME/.colima/default/docker.sock" ]]; then
  export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
fi

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
