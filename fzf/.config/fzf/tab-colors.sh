#!/bin/zsh

# Darkvoid FZF-Tab Colors
zstyle ':fzf-tab:complete:*' fzf-preview \
  'bat --color=always --style=header,grid --line-range :300 $realpath'
zstyle ':fzf-tab:*' fzf-flags \
  --color=bg:-1,bg+:#303030,fg:#c0c0c0,fg+:#ebdbb2,hl:#d3869b,hl+:#bdfe58 \
  --color=header:#b2d8d8,info:#b1b1b1,pointer:#1bfd9c \
  --color=marker:#66b2b2,prompt:#d1d1d1,spinner:#1bfd9c \
  --color=border:#404040,gutter:-1,separator:#404040
zstyle ':fzf-tab:*' fzf-command 'fzf'
zstyle ':fzf-tab:*' accept-line enter
