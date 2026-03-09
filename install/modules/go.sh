#!/usr/bin/env bash
# ── Go ────────────────────────────────────────────────────────────────────────
# pkg manager로 설치 (모든 주요 distro에서 공식 패키지 제공)
# 최신 버전이 필요한 경우 go install로 직접 관리 가능

install_go() {
  step "Installing Go"

  if check_cmd go; then
    log_success "go $(go version) already installed"
    return 0
  fi

  pkg_install golang
  export PATH="/usr/local/go/bin:$PATH"

  log_success "Go installed: $(go version)"
}
