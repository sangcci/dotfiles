# ── Docker / Testcontainers ───────────────────────────────────────────────────
# Docker CLI can resolve the active context, but JVM tools such as Testcontainers
# often probe /var/run/docker.sock first. On macOS + Colima that socket may not
# exist, so point them at Colima's Unix socket without overriding explicit user
# configuration.
if [[ "$DOTFILES_OS" == "macos" && -z "$DOCKER_HOST" && -S "$HOME/.colima/default/docker.sock" ]]; then
  export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
fi
