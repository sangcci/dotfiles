#!/usr/bin/env bash
# ── Node.js (via fnm) ─────────────────────────────────────────────────────────
# fnm 자체는 pkg manager로, 그 다음 fnm이 node 버전 관리

install_node() {
  step "Installing Node.js via fnm"

  # fnm 설치
  if ! check_cmd fnm; then
    case "$DISTRO" in
      arch)
        # fnm은 AUR에만 있어서 공식 패키지 없음 → curl 설치
        pkg_install_if_missing curl curl
        curl -fsSL https://fnm.vercel.app/install | bash --no-use
        ;;
      debian|fedora)
        curl -fsSL https://fnm.vercel.app/install | bash --no-use
        ;;
    esac
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "$(fnm env)"
  fi

  # node 설치 (fnm으로 버전 관리)
  if check_cmd node; then
    log_success "node $(node --version) already installed"
    return 0
  fi

  fnm install --lts
  fnm use lts-latest
  fnm default lts-latest

  log_success "node installed: $(node --version)"
}
