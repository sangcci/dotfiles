#!/bin/zsh

_ZSH="${ZDOTDIR:-$HOME}/.zsh"

source "$_ZSH/core/detect.zsh"    # load first
source "$_ZSH/core/lib.zsh"

source "$_ZSH/core/path.zsh"
source "$_ZSH/core/env.zsh"
source "$_ZSH/core/history.zsh"
source "$_ZSH/core/completion.zsh"
source "$_ZSH/core/aliases.zsh"
source "$_ZSH/core/functions.zsh"

source "$_ZSH/core/plugin-list.zsh"
_dotfiles_load_plugins

source "$_ZSH/core/keybinds.zsh"
