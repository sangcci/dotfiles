# ── Key bindings ──────────────────────────────────────────────────────────────
# fzf's shell integration also binds Tab; let zsh-autocomplete own completion.
if (( $+widgets[down-line-or-select] )); then
  bindkey '^I' complete-word
fi

if (( $+widgets[autosuggest-accept] )); then
  bindkey '^ ' autosuggest-accept
  bindkey '^f' autosuggest-accept
fi

if (( $+widgets[history-substring-search-up] )); then
  bindkey '^p' history-substring-search-up
fi

if (( $+widgets[history-substring-search-down] )); then
  bindkey '^n' history-substring-search-down
fi
