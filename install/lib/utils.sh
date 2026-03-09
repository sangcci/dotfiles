#!/usr/bin/env bash
# ── Common Utilities ──────────────────────────────────────────────────────────

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; BOLD='\033[1m'; NC='\033[0m'

log_info()    { echo -e "${BLUE}[INFO]${NC}  $*"; }
log_success() { echo -e "${GREEN}[✓]${NC}    $*"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC}  $*"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; }

step() {
  echo ""
  echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}  $*${NC}"
  echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

check_cmd() { command -v "$1" &>/dev/null; }

require_cmd() {
  if ! check_cmd "$1"; then
    log_error "Required command not found: $1"
    exit 1
  fi
}

# Get latest GitHub release tag (strips leading 'v')
github_latest_version() {
  local repo=$1
  curl -fsSL "https://api.github.com/repos/${repo}/releases/latest" \
    | grep '"tag_name"' \
    | sed -E 's/.*"v?([^"]+)".*/\1/'
}

download() {
  local url=$1 dest=$2
  log_info "Downloading $(basename "$dest")..."
  curl -fsSL --progress-bar -o "$dest" "$url"
}

# Create ~/.local/bin symlink for command aliasing
make_symlink() {
  local src=$1 name=$2
  mkdir -p "$HOME/.local/bin"
  ln -sf "$src" "$HOME/.local/bin/$name"
  log_info "Symlink: $name → $src"
}
