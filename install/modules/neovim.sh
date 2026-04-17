#!/usr/bin/env bash
# ── Neovim (via bob) ──────────────────────────────────────────────────────────
# Always installs nightly via bob (vim.pack API requires v0.12+ nightly)
# Requires: rust (cargo)

install_neovim() {
  step "Installing Neovim nightly via bob"

  require_cmd cargo

  if ! check_cmd bob; then
    cargo install bob-nvim
  else
    log_info "bob already installed: $(bob --version)"
  fi

  bob install nightly
  bob use nightly

  log_success "nvim installed: $(nvim --version | head -1)"
}
