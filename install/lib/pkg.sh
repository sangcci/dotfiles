#!/usr/bin/env bash
# ── Package Manager Abstraction ───────────────────────────────────────────────
# Requires: DISTRO, PKG_MANAGER from detect.sh

# Resolve distro-specific package name
# Some tools have different names across distros
_pkg_resolve() {
  local tool=$1
  case "$DISTRO" in
    debian)
      case "$tool" in
        bat)             echo "batcat"        ;;
        fd)              echo "fd-find"       ;;
        build-essential) echo "build-essential" ;;
        golang)          echo "golang"        ;;
        *)               echo "$tool"         ;;
      esac ;;
    arch)
      case "$tool" in
        build-essential) echo "base-devel"    ;;
        golang)          echo "go"            ;;
        *)               echo "$tool"         ;;
      esac ;;
    fedora)
      case "$tool" in
        build-essential) echo "gcc make"      ;;  # resolved as two packages below
        fd)              echo "fd-find"       ;;
        golang)          echo "golang"        ;;
        *)               echo "$tool"         ;;
      esac ;;
    *)
      echo "$tool" ;;
  esac
}

pkg_update() {
  log_info "Updating package lists..."
  case "$PKG_MANAGER" in
    apt)    sudo apt update -y ;;
    pacman) sudo pacman -Sy --noconfirm ;;
    dnf)    sudo dnf check-update -y || true ;;  # dnf returns 100 when updates available
  esac
}

pkg_upgrade() {
  log_info "Upgrading installed packages..."
  case "$PKG_MANAGER" in
    apt)    sudo apt upgrade -y ;;
    pacman) sudo pacman -Su --noconfirm ;;
    dnf)    sudo dnf upgrade -y ;;
  esac
}

# pkg_install tool1 tool2 ...
# Each tool name is a generic name; resolved per-distro via _pkg_resolve
pkg_install() {
  local -a resolved=()
  for tool in "$@"; do
    local name
    name="$(_pkg_resolve "$tool")"
    # "gcc make" → split into multiple packages
    for part in $name; do
      resolved+=("$part")
    done
  done

  [[ ${#resolved[@]} -eq 0 ]] && return 0
  log_info "Installing: ${resolved[*]}"

  case "$PKG_MANAGER" in
    apt)    sudo apt install -y "${resolved[@]}" ;;
    pacman) sudo pacman -S --noconfirm --needed "${resolved[@]}" ;;
    dnf)    sudo dnf install -y "${resolved[@]}" ;;
    *)      log_error "Unknown package manager: $PKG_MANAGER"; return 1 ;;
  esac
}

# Install only if command is not already available
pkg_install_if_missing() {
  local cmd=$1; shift
  if ! check_cmd "$cmd"; then
    pkg_install "$@"
  else
    log_info "$cmd already installed, skipping"
  fi
}

# After installing fd-find (Debian) or fd-find (Fedora), binary names differ:
#   Debian: fdfind  →  symlink to fd
#   Others: fd
fix_fd_symlink() {
  if [[ "$DISTRO" == "debian" ]] && check_cmd fdfind && ! check_cmd fd; then
    make_symlink "$(which fdfind)" fd
  fi
}

# After installing batcat (Debian), symlink to bat for tool compatibility
fix_bat_symlink() {
  if [[ "$DISTRO" == "debian" ]] && check_cmd batcat && ! check_cmd bat; then
    make_symlink "$(which batcat)" bat
  fi
}
