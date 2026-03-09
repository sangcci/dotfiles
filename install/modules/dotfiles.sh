#!/usr/bin/env bash
# ── Dotfiles Setup (stow) ─────────────────────────────────────────────────────

install_dotfiles() {
  step "Setting up Dotfiles"

  require_cmd stow
  require_cmd git

  local dotfiles_dir="${DOTFILES_DIR:-$HOME/dotfiles}"

  if [[ ! -d "$dotfiles_dir" ]]; then
    log_info "Cloning dotfiles to $dotfiles_dir..."
    git clone https://github.com/sangcci/dotfiles.git "$dotfiles_dir"
  else
    log_info "Dotfiles already at $dotfiles_dir"
  fi

  cd "$dotfiles_dir"

  # Backup existing .zshrc if it's not already a symlink
  if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    local backup="$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"
    log_warn "Backing up existing .zshrc → $backup"
    mv "$HOME/.zshrc" "$backup"
  fi

  local packages=(zsh git)
  [[ "${DOTFILES_PROFILE:-lite}" == "full" ]] && packages+=(nvim)

  for pkg in "${packages[@]}"; do
    if [[ -d "$dotfiles_dir/$pkg" ]]; then
      stow --restow "$pkg"
      log_info "Stowed: $pkg"
    fi
  done

  log_success "Dotfiles configured"
}
