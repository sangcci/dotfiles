#!/usr/bin/env bash
# ── fzf ───────────────────────────────────────────────────────────────────────

install_fzf() {
  step "Installing fzf"

  if check_cmd fzf; then
    log_success "fzf $(fzf --version) already installed"
    return 0
  fi

  pkg_install fzf
  log_success "fzf installed: $(fzf --version)"
}
