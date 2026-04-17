#!/bin/zsh
_ZSH_MODULES="${ZDOTDIR:-$HOME}/.zsh"

source "$_ZSH_MODULES/detect.zsh"    # load first
source "$_ZSH_MODULES/path.zsh"
source "$_ZSH_MODULES/plugins.zsh"
source "$_ZSH_MODULES/env.zsh"
source "$_ZSH_MODULES/history.zsh"
source "$_ZSH_MODULES/completion.zsh"
source "$_ZSH_MODULES/keybinds.zsh"
source "$_ZSH_MODULES/aliases.zsh"
source "$_ZSH_MODULES/functions.zsh"
