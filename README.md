# Introduction

Personal dotfiles managed mainly by GNU Stow. The setup is optimized for **macOS** and keeps each tool configuration in its own stow package. Windows host settings are managed separately with PowerShell under `windows/`.

# Features

- **Neovim**: Profile-based setup using Neovim 0.12+ `vim.pack`.
- **Kitty**: Primary terminal with custom fonts, tabs, splits, and themes.
- **Zsh**: Modular shell configuration with guarded tool plugins.
- **AeroSpace + JankyBorders**: Keyboard-driven macOS window management with custom borders.
- **Yazi**: Primary terminal file manager.
- **Git / fzf / bat**: Modern CLI defaults and themes.
- **Nix**: nix-darwin configuration modules for macOS setup.

# Requirements & Toolkit

## Core

- macOS
- [GNU Stow](https://www.gnu.org/software/stow/)
- [Homebrew](https://brew.sh/)
- **Kitty**
- **Neovim** 0.12+

## Common CLI tools

- **zoxide** — smarter `cd`
- **fzf** — fuzzy finder, plus fzf-tab integration
- **bat** — syntax-highlighted `cat`
- **lsd** — modern `ls`
- **yazi** — terminal file manager
- **uv**, **bob**, **bun** — language/runtime helpers

## macOS apps

| Category | Tool | Notes |
|---|---|---|
| Terminal | Kitty | Primary terminal |
| Browser | Safari / Brave | Main / dev |
| Code Editor | Neovim | VS Code and Zed configs are deprecated |
| File Manager | Yazi / Finder | Main / fallback |
| Window Manager | AeroSpace | Uses JankyBorders |
| Notes | Obsidian, Anki, Notion | |
| LLM CLI | Claude Code, Gemini CLI, Codex | |
| Container | Docker, Colima, Testcontainers Desktop | |

# Structure

```text
.
├── aerospace/     AeroSpace config
├── anki/          Anki ReColor theme and card templates
├── bat/           bat config and themes
├── fzf/           fzf and fzf-tab color config
├── fzf-git/       vendored fzf-git key bindings
├── git/           git config, ignore, hooks, commitlint
├── jankyborders/  JankyBorders config
├── kitty/         Kitty terminal config
├── nix/           nix-darwin config
├── nvim/          Neovim config
├── obsidian/      Obsidian CSS snippets
├── vscode/        Deprecated VS Code config
├── yazi/          Yazi config and flavors
├── windows/       Windows host PowerShell configuration
├── zed/           Deprecated Zed config
└── zsh/           Modular zsh config
```

# Usage

Clone this repository to `~/dotfiles` and stow the packages you use.

```zsh
cd ~/dotfiles

stow zsh
stow git
stow nvim
stow kitty
stow fzf
stow bat
stow yazi
stow aerospace
stow jankyborders
stow obsidian
stow anki
stow nix
```

For Windows host settings, see [`windows/README.md`](windows/README.md). WSL should use its own Linux/Nix configuration rather than this Windows bootstrap.

Deprecated configs are kept for reference and usually should not be stowed:

```zsh
# stow vscode
# stow zed
```
