# ── OS Detection ─────────────────────────────────────────────────────────────
if [[ "$(uname -s)" == "Darwin" ]]; then
  export DOTFILES_OS="macos"
elif [[ -f /etc/os-release ]]; then
  . /etc/os-release
  case "$ID" in
    debian|ubuntu|raspbian) export DOTFILES_OS="debian" ;;
    arch|manjaro)           export DOTFILES_OS="arch" ;;
    *)                      export DOTFILES_OS="linux" ;;
  esac
else
  export DOTFILES_OS="linux"
fi

# ── Profile Detection ─────────────────────────────────────────────────────────
# Default: lite (opt-in full)
# To enable full profile, add to your shell config: export DOTFILES_PROFILE=full
export DOTFILES_PROFILE="${DOTFILES_PROFILE:-lite}"
export NVIM_PROFILE="$DOTFILES_PROFILE"
