#!/usr/bin/env bash
# ── Python (via uv) ───────────────────────────────────────────────────────────

install_python() {
  step "Installing Python via uv"

  if check_cmd uv; then
    log_success "uv $(uv --version) already installed"
    return 0
  fi

  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"

  log_success "uv installed: $(uv --version)"
}
