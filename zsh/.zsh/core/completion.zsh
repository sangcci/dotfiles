# Register installed completion directories before zplug initializes compinit.
# Nix-provided paths already in fpath are preserved.
typeset -gU fpath
_dotfiles_completion_dirs=(
  "$HOME/.local/share/zsh/site-functions"
  "$HOME/.local/share/zsh/vendor-completions"
  "$HOME/.docker/completions"
  /opt/homebrew/share/zsh/site-functions
  /opt/homebrew/share/zsh/vendor-completions
  /usr/local/share/zsh/site-functions
  /usr/local/share/zsh/vendor-completions
)
for _dotfiles_completion_dir in "${(Oa)_dotfiles_completion_dirs[@]}"; do
  [[ -d "$_dotfiles_completion_dir" ]] || continue
  fpath=("$_dotfiles_completion_dir" "${fpath[@]}")
done
unset _dotfiles_completion_dir _dotfiles_completion_dirs

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
