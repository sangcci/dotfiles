#!/bin/zsh
_ZSH_MODULES="${ZDOTDIR:-$HOME}/.zsh"

source "$_ZSH_MODULES/detect.zsh"    # OS + profile 감지 (제일 먼저)
source "$_ZSH_MODULES/path.zsh"      # PATH 설정
source "$_ZSH_MODULES/plugins.zsh"   # zplug
source "$_ZSH_MODULES/env.zsh"       # 환경변수 + shell integrations
source "$_ZSH_MODULES/history.zsh"   # history 설정
source "$_ZSH_MODULES/completion.zsh" # completion 설정
source "$_ZSH_MODULES/keybinds.zsh"  # 키바인딩
source "$_ZSH_MODULES/aliases.zsh"   # alias
source "$_ZSH_MODULES/functions.zsh" # shell functions
