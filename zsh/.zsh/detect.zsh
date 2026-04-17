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
# macOS: full by default, Linux: lite by default (opt-in full)
if [[ -z "$DOTFILES_PROFILE" ]]; then
  [[ "$DOTFILES_OS" == "macos" ]] && export DOTFILES_PROFILE="full" || export DOTFILES_PROFILE="lite"
fi
export NVIM_PROFILE="$DOTFILES_PROFILE"
