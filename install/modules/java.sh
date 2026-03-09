#!/usr/bin/env bash
# ── Java (via SDKMAN) ─────────────────────────────────────────────────────────

install_java() {
  step "Installing Java via SDKMAN"

  if [[ -d "$HOME/.sdkman" ]]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    log_success "SDKMAN $(sdk version 2>/dev/null | grep -oE '[0-9.]+' | head -1) already installed"
    return 0
  fi

  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"

  sdk install java
  log_success "Java installed: $(java --version 2>&1 | head -1)"
}
