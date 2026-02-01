#!/bin/zsh

# Kanagawa Paper Ink FZF-Tab Colors
zstyle ':fzf-tab:complete:*' fzf-preview \
  'bat --color=always --style=header,grid --line-range :300 $realpath'
zstyle ':fzf-tab:*' fzf-flags \
  --color=bg:-1,bg+:#2A2A37,fg:-1,fg+:#DCD7BA,hl:#938AA9,hl+:#c4746e \
  --color=header:#b6927b,info:#658594,pointer:#7AA89F \
  --color=marker:#7AA89F,prompt:#c4746e,spinner:#8ea49e
zstyle ':fzf-tab:*' fzf-command 'fzf'
zstyle ':fzf-tab:*' accept-line enter
