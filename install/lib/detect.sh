#!/usr/bin/env bash
# ── OS / Architecture Detection ───────────────────────────────────────────────

_detect_distro() {
  [[ ! -f /etc/os-release ]] && echo "unknown" && return
  . /etc/os-release
  case "$ID" in
    debian|ubuntu|raspbian|linuxmint|pop) echo "debian" ;;
    arch|manjaro|endeavouros|garuda)      echo "arch"   ;;
    fedora|rhel|centos|rocky|almalinux)   echo "fedora" ;;
    *)
      case "${ID_LIKE:-}" in
        *debian*) echo "debian" ;;
        *arch*)   echo "arch"   ;;
        *fedora*|*rhel*) echo "fedora" ;;
        *) echo "unknown" ;;
      esac ;;
  esac
}

_detect_arch() {
  case "$(uname -m)" in
    x86_64|amd64)  echo "x86_64"  ;;
    aarch64|arm64) echo "aarch64" ;;
    armv7l)        echo "armv7"   ;;
    *)             echo "$(uname -m)" ;;
  esac
}

export DISTRO
export SYS_ARCH
export PKG_MANAGER

DISTRO="$(_detect_distro)"
SYS_ARCH="$(_detect_arch)"

case "$DISTRO" in
  debian) PKG_MANAGER="apt"    ;;
  arch)   PKG_MANAGER="pacman" ;;
  fedora) PKG_MANAGER="dnf"    ;;
  *)      PKG_MANAGER="unknown" ;;
esac
