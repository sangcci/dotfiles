#!/bin/zsh
_ZSH_MODULES="${ZDOTDIR:-$HOME}/.zsh"

source "$_ZSH_MODULES/detect.zsh"    # OS + profile detection (load first)
source "$_ZSH_MODULES/path.zsh"      # PATH setup
source "$_ZSH_MODULES/plugins.zsh"   # zplug
source "$_ZSH_MODULES/env.zsh"       # env vars + shell integrations
source "$_ZSH_MODULES/history.zsh"   # history settings
source "$_ZSH_MODULES/completion.zsh" # completion settings
source "$_ZSH_MODULES/keybinds.zsh"  # key bindings
source "$_ZSH_MODULES/aliases.zsh"   # aliases
source "$_ZSH_MODULES/functions.zsh" # shell functions
