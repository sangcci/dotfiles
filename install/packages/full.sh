#!/usr/bin/env bash
# ── Full Profile: complete dev environment ────────────────────────────────────
# lite + rust · node (fnm) · python (uv) · java (sdkman) · go

source "$INSTALL_DIR/packages/lite.sh"
source "$INSTALL_DIR/modules/rust.sh"
source "$INSTALL_DIR/modules/node.sh"
source "$INSTALL_DIR/modules/python.sh"
source "$INSTALL_DIR/modules/java.sh"
source "$INSTALL_DIR/modules/go.sh"

run_full() {
  # Run lite first (installs base + neovim via bob after rust is ready)
  run_lite

  step "Profile: full (dev tools)"

  install_rust
  install_neovim  # re-run: now uses bob (cargo available), skips if already done
  install_node
  install_python
  install_java
  install_go

  echo ""
  log_success "Full profile complete!"
  log_info "Restart shell or run: exec zsh"
}
