#!/bin/zsh

# Kanso Ink FZF colors — palette from webhooked/kanso.nvim
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS }\
--color=fg:#c5c9c7,bg:#14171d,hl:#7fb4ca \
--color=fg+:#f2f1ef,bg+:#1f1f26,hl+:#7fb4ca \
--color=info:#e6c384,prompt:#8ba4b0,pointer:#7fb4ca \
--color=marker:#87a987,spinner:#938aa9,header:#87a987 \
--color=border:#393b44,label:#c5c9c7"
