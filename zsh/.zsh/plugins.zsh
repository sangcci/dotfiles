# ── zplug home ────────────────────────────────────────────────────────────────
case "$DOTFILES_OS" in
  macos) export ZPLUG_HOME="/opt/homebrew/opt/zplug" ;;
  *)     export ZPLUG_HOME="$HOME/.zplug" ;;
esac

source "$ZPLUG_HOME/init.zsh"

# ── Plugins ───────────────────────────────────────────────────────────────────
zplug "mafredri/zsh-async", from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "Aloxaf/fzf-tab", from:github
zplug "olets/zsh-transient-prompt"

zplug "plugins/git", from:oh-my-zsh

# ── Install missing plugins ───────────────────────────────────────────────────
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# ── Plugin settings ───────────────────────────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Pure enhanced with transient prompt
TRANSIENT_PROMPT_PROMPT=$'%F{${prompt_pure_colors[path]}}%~%f\n%{\C-M%}%(12V.%F{$prompt_pure_colors[virtualenv]}%12v%f .)%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]}%f '
TRANSIENT_PROMPT_TRANSIENT_PROMPT='%(12V.%F{$prompt_pure_colors[virtualenv]}%12v%f .)%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]} %f'
