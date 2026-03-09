#!/usr/bin/env bash
# ── Linux Dotfiles Installer ──────────────────────────────────────────────────
# Usage:
#   ./install.sh          interactive profile selection
#   ./install.sh lite     server / VM baseline
#   ./install.sh full     full dev environment
set -euo pipefail

INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$INSTALL_DIR/lib/detect.sh"
source "$INSTALL_DIR/lib/utils.sh"
source "$INSTALL_DIR/lib/pkg.sh"

# ── Sanity checks ─────────────────────────────────────────────────────────────
if [[ "$(uname -s)" != "Linux" ]]; then
  log_error "This installer is for Linux only."
  exit 1
fi

if [[ "$PKG_MANAGER" == "unknown" ]]; then
  log_error "Unsupported distro: $DISTRO"
  log_error "Supported: Debian/Ubuntu, Arch, Fedora/RHEL"
  exit 1
fi

# ── Profile selection ─────────────────────────────────────────────────────────
PROFILE="${1:-}"

if [[ -z "$PROFILE" ]]; then
  echo ""
  echo -e "  Distro : \033[1m${DISTRO}\033[0m (${PKG_MANAGER})"
  echo -e "  Arch   : \033[1m${SYS_ARCH}\033[0m"
  echo ""
  echo "  Select a profile:"
  echo "    1) lite  — server/VM baseline (zsh, nvim, fzf, zoxide, lsd, bat, ripgrep)"
  echo "    2) full  — dev environment    (lite + rust, node, python, java, go)"
  echo ""
  read -r -p "  Choice [1/2]: " _choice
  case "$_choice" in
    1|lite) PROFILE="lite" ;;
    2|full) PROFILE="full" ;;
    *) log_error "Invalid choice: $_choice"; exit 1 ;;
  esac
fi

export DOTFILES_PROFILE="$PROFILE"

# ── Run ───────────────────────────────────────────────────────────────────────
case "$PROFILE" in
  lite)
    source "$INSTALL_DIR/packages/lite.sh"
    run_lite
    ;;
  full)
    source "$INSTALL_DIR/packages/full.sh"
    run_full
    ;;
  *)
    log_error "Unknown profile: $PROFILE (use: lite | full)"
    exit 1
    ;;
esac
