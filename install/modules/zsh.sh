#!/usr/bin/env bash
# ── Zsh ───────────────────────────────────────────────────────────────────────

install_zsh() {
  step "Installing Zsh"

  if check_cmd zsh; then
    log_success "zsh $(zsh --version | awk '{print $2}') already installed"
    return 0
  fi

  pkg_install zsh
  log_success "zsh installed: $(zsh --version)"

  if [[ "$SHELL" != "$(which zsh)" ]]; then
    log_info "To set zsh as default shell, run: chsh -s \$(which zsh)"
  fi
}
