# ── Common ────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"

# ── OS-specific base paths ────────────────────────────────────────────────────
case "$DOTFILES_OS" in
  macos)
    export PATH="/opt/homebrew/bin:$PATH"
    ;;
esac

# ── Lite + Full (rust & neovim via bob) ───────────────────────────────────────
# Rust cargo (lite에서 bob 의존성으로 설치됨)
export PATH="$HOME/.cargo/bin:$PATH"

# Bob Neovim Version Manager (lite 포함 모든 프로파일)
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# ── Full profile only ─────────────────────────────────────────────────────────
if [[ "$DOTFILES_PROFILE" == "full" ]]; then
  # Bun
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"

  # tree-sitter-cli (npm global)
  export PATH="$(npm config get prefix)/bin:$PATH"

  # OS-specific full paths
  case "$DOTFILES_OS" in
    macos)
	  export PATH="$(brew --prefix postgresql@18)/bin:$PATH"
      export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
      ;;
    debian|linux)
      export PATH="/usr/bin/node:$PATH"
      ;;
  esac
fi
