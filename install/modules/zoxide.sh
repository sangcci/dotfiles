#!/usr/bin/env bash
# ── zoxide ────────────────────────────────────────────────────────────────────
# Available in: apt (Debian 12+/Ubuntu 22.04+), pacman, dnf

install_zoxide() {
  step "Installing zoxide"

  if check_cmd zoxide; then
    log_success "zoxide $(zoxide --version) already installed"
    return 0
  fi

  pkg_install zoxide
  log_success "zoxide installed: $(zoxide --version)"
}
