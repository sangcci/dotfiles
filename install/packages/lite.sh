#!/usr/bin/env bash
# ── Lite Profile: server / VM baseline ───────────────────────────────────────
# zsh · git · ripgrep · fd · bat · fzf · zoxide · lsd · rust · neovim · dotfiles

source "$INSTALL_DIR/modules/zsh.sh"
source "$INSTALL_DIR/modules/fzf.sh"
source "$INSTALL_DIR/modules/zoxide.sh"
source "$INSTALL_DIR/modules/lsd.sh"
source "$INSTALL_DIR/modules/rust.sh"
source "$INSTALL_DIR/modules/neovim.sh"
source "$INSTALL_DIR/modules/dotfiles.sh"

run_lite() {
  step "Profile: lite"

  pkg_update

  # Base packages (distro-generic names, resolved by pkg.sh)
  pkg_install \
    git curl wget \
    build-essential \
    stow zip unzip \
    ripgrep fd bat

  # Debian: fd-find → fd, batcat → bat symlinks for cross-tool compatibility
  fix_fd_symlink
  fix_bat_symlink

  install_zsh
  install_fzf
  install_zoxide
  install_lsd
  install_rust    # bob 의존성
  install_neovim
  install_dotfiles

  echo ""
  log_success "Lite profile complete!"
  log_info "Restart shell or run: exec zsh"
}
