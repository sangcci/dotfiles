#!/usr/bin/env bash
# ── lsd ───────────────────────────────────────────────────────────────────────
# Arch/Fedora : pkg manager
# Debian      : not in apt → install .deb from GitHub releases

install_lsd() {
  step "Installing lsd"

  if check_cmd lsd; then
    log_success "lsd $(lsd --version | awk '{print $2}') already installed"
    return 0
  fi

  case "$DISTRO" in
    arch|fedora)
      pkg_install lsd
      ;;
    debian)
      local version arch_deb tmpdir
      version="$(github_latest_version 'lsd-rs/lsd')"
      case "$SYS_ARCH" in
        x86_64)  arch_deb="amd64" ;;
        aarch64) arch_deb="arm64" ;;
        armv7)   arch_deb="armhf" ;;
        *)       log_error "Unsupported arch for lsd: $SYS_ARCH"; return 1 ;;
      esac

      tmpdir="$(mktemp -d)"
      local deb="lsd_${version}_${arch_deb}.deb"
      download \
        "https://github.com/lsd-rs/lsd/releases/download/v${version}/${deb}" \
        "$tmpdir/$deb"
      sudo dpkg -i "$tmpdir/$deb"
      rm -rf "$tmpdir"
      ;;
    *)
      log_warn "Unknown distro, skipping lsd"
      return 1
      ;;
  esac

  log_success "lsd installed: $(lsd --version)"
}
