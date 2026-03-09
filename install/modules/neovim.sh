#!/usr/bin/env bash
# ── Neovim (via bob) ──────────────────────────────────────────────────────────
# 항상 bob으로 nightly 설치 (vim.pack API는 v0.12+ nightly 필요)
# 의존성: rust (cargo)

install_neovim() {
  step "Installing Neovim nightly via bob"

  require_cmd cargo

  # bob 설치
  if ! check_cmd bob; then
    cargo install bob-nvim
  else
    log_info "bob already installed: $(bob --version)"
  fi

  # nightly 설치 및 활성화
  bob install nightly
  bob use nightly

  log_success "nvim installed: $(nvim --version | head -1)"
}
