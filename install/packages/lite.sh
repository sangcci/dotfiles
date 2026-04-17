#!/usr/bin/env bash
# ── Installer: server / VM baseline ──────────────────────────────────────────
# zsh · git · ripgrep · fd · bat · fzf · zoxide · lsd · rust · neovim · dotfiles

source "$INSTALL_DIR/modules/zsh.sh"
source "$INSTALL_DIR/modules/zplug.sh"
source "$INSTALL_DIR/modules/fzf.sh"
source "$INSTALL_DIR/modules/zoxide.sh"
source "$INSTALL_DIR/modules/lsd.sh"
source "$INSTALL_DIR/modules/rust.sh"
source "$INSTALL_DIR/modules/neovim.sh"
source "$INSTALL_DIR/modules/dotfiles.sh"

run_lite() {
  step "Installing dotfiles"

  pkg_update

  pkg_install \
    git curl wget \
    build-essential \
    stow zip unzip \
    ripgrep fd bat

  fix_fd_symlink
  fix_bat_symlink

  install_zsh
  install_zplug
  install_fzf
  install_zoxide
  install_lsd
  install_rust
  install_neovim
  install_dotfiles

  echo ""
  log_success "Done!"
  log_info "Restart shell or run: exec zsh"
}
