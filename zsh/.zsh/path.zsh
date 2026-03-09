# ── Common ────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"

# ── OS-specific base paths ────────────────────────────────────────────────────
case "$DOTFILES_OS" in
  macos)
    export PATH="/opt/homebrew/bin:$PATH"
    ;;
esac

# ── Full profile only ─────────────────────────────────────────────────────────
if [[ "$DOTFILES_PROFILE" == "full" ]]; then
  # Rust
  export PATH="$HOME/.cargo/bin:$PATH"

  # Bun
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"

  # Bob Neovim Version Manager
  export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

  # tree-sitter-cli (npm global)
  export PATH="$(npm config get prefix)/bin:$PATH"

  # OS-specific full paths
  case "$DOTFILES_OS" in
    macos)
      export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
      export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
      ;;
    debian|linux)
      export PATH="/usr/bin/node:$PATH"
      ;;
  esac
fi
