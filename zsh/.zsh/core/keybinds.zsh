# ── Key bindings ──────────────────────────────────────────────────────────────
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
