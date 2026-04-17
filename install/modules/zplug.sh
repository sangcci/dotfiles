#!/usr/bin/env bash
# ── zplug ─────────────────────────────────────────────────────────────────────

install_zplug() {
  step "Installing zplug"

  if [[ -f "$HOME/.zplug/init.zsh" ]]; then
    log_success "zplug already installed"
    return 0
  fi

  curl -sL https://raw.githubusercontent.com/zplug/zplug/master/installer.zsh | zsh

  log_success "zplug installed: $HOME/.zplug"
}
