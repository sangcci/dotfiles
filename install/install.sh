#!/usr/bin/env bash
# ── Linux Dotfiles Installer ──────────────────────────────────────────────────
# Usage: ./install.sh
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

source "$INSTALL_DIR/packages/lite.sh"
run_lite
