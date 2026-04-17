# ── Common ────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"

# ── OS-specific base paths ────────────────────────────────────────────────────
case "$DOTFILES_OS" in
  macos)
    export PATH="/opt/homebrew/bin:$PATH"
    ;;
esac

# ── Lite + Full (rust & neovim via bob) ───────────────────────────────────────
# Rust cargo (installed as bob dependency in lite profile)
export PATH="$HOME/.cargo/bin:$PATH"

# Bob Neovim Version Manager (all profiles including lite)
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
	  export PATH="$(brew --prefix postgresql@16)/bin:$PATH"
      export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
      ;;
  esac
fi
