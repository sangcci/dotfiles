#!/usr/bin/env bash
# ── Rust ──────────────────────────────────────────────────────────────────────

install_rust() {
  step "Installing Rust (rustup)"

  if check_cmd cargo; then
    log_success "Rust $(rustc --version) already installed"
    return 0
  fi

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
  source "$HOME/.cargo/env"

  log_success "Rust installed: $(rustc --version)"
}
