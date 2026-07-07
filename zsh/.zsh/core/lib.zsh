# ── Shared helpers ────────────────────────────────────────────────────────────
# Keep PATH unique while preserving order. zsh keeps $path and $PATH in sync.
typeset -gU path PATH

_dotfiles_prepend_path() {
  local dir="$1"
  [[ -n "$dir" && -d "$dir" ]] || return 0

  path=("$dir" "${path[@]}")
}

_dotfiles_source_if_exists() {
  local file="$1"
  [[ -s "$file" ]] || return 0

  source "$file"
}

_dotfiles_load_plugin() {
  local name="$1"
  local file="$_ZSH/plugins/$name.zsh"

  [[ -s "$file" ]] || return 0
  source "$file"
}

_dotfiles_load_plugins() {
  local plugin
  for plugin in "${DOTFILES_PLUGINS[@]}"; do
    _dotfiles_load_plugin "$plugin"
  done
}
