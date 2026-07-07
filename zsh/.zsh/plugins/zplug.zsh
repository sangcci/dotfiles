# ── zplug home ────────────────────────────────────────────────────────────────
case "$DOTFILES_OS" in
  macos)
    if command -v brew &>/dev/null && [[ -s "$(brew --prefix zplug 2>/dev/null)/init.zsh" ]]; then
      export ZPLUG_HOME="$(brew --prefix zplug)"
    else
      export ZPLUG_HOME="/opt/homebrew/opt/zplug"
    fi
    ;;
  *)
    export ZPLUG_HOME="$HOME/.zplug"
    ;;
esac

if [[ ! -s "$ZPLUG_HOME/init.zsh" ]]; then
  print -u2 "[zsh] zplug not found at $ZPLUG_HOME; skipping plugin load."
  return 0
fi

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
  if [[ -o interactive ]]; then
    printf "Install missing zplug plugins? [y/N]: "
    if read -q; then
      echo; zplug install
    else
      echo
    fi
  else
    print -u2 "[zsh] missing zplug plugins; run 'zplug install' in an interactive shell."
  fi
fi

zplug load

# ── Terminal title ────────────────────────────────────────────────────────────
# Pure sets the terminal title to the current path on every prompt, which kitty
# uses as the tab title. Keep idle kitty tabs short, while preserving Pure's
# running-command title from preexec.
if (( $+functions[prompt_pure_set_title] )); then
  functions[prompt_pure_set_title_original]=$functions[prompt_pure_set_title]
  prompt_pure_set_title() {
    if [[ "$TERM" == "xterm-kitty" && "$1" == "expand-prompt" ]]; then
      print -n $'\e]0;kitty\a'
      return
    fi

    prompt_pure_set_title_original "$@"
  }
fi

# ── Plugin settings ───────────────────────────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#404040'

# Darkvoid prompt colors
zstyle ':prompt:pure:path' color '#d1d1d1'
zstyle ':prompt:pure:prompt:success' color '#d3869b'
zstyle ':prompt:pure:prompt:error' color '#e62020'
zstyle ':prompt:pure:git:branch' color '#b2d8d8'
zstyle ':prompt:pure:git:dirty' color '#bdfe58'
zstyle ':prompt:pure:git:arrow' color '#1bfd9c'
zstyle ':prompt:pure:git:stash' color '#d3869b'
zstyle ':prompt:pure:execution_time' color '#b1b1b1'
zstyle ':prompt:pure:virtualenv' color '#66b2b2'
zstyle ':prompt:pure:suspended_jobs' color '#e62020'

# Darkvoid syntax highlighting
ZSH_HIGHLIGHT_STYLES[comment]='fg=#404040'
ZSH_HIGHLIGHT_STYLES[command]='fg=#c0c0c0'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b2d8d8'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#b2d8d8'
ZSH_HIGHLIGHT_STYLES[function]='fg=#b2d8d8'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#d3869b'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#bdfe58'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#bdfe58'
ZSH_HIGHLIGHT_STYLES[path]='fg=#d1d1d1'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#1bfd9c'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#e62020'

# Pure enhanced with transient prompt
TRANSIENT_PROMPT_PROMPT=$'%F{${prompt_pure_colors[path]}}%~%f\n%{\C-M%}%(12V.%F{$prompt_pure_colors[virtualenv]}%12v%f .)%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]}%f '
TRANSIENT_PROMPT_TRANSIENT_PROMPT='%(12V.%F{$prompt_pure_colors[virtualenv]}%12v%f .)%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]} %f'
