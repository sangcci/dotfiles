# Introduction

This is my personal dotfiles managed by GNU Stow. It pursues extreme minimalism and efficiency.

Primarily optimized for **macOS**, with Linux support via the `install/` script.

# Features

- **Hybrid Neovim**: Shared configuration between native Neovim and VS Code (powered by `vim.g.vscode`).
- **VS Code**: Manage settings, keybindings, and extensions via Stow.
- **Wezterm**: GPU-accelerated terminal with modular configuration.
- **Zsh**: Minimalist setup with essential plugins via `zplug` and modern CLI alternatives.
- **Pre-configured LSP & Debugging**: Ready-to-use development environment.
- **Visuals**: GitHub Dark theme with transparency, font: **D2CodingLigature Nerd Font**.

### Requirements & Toolkit

#### Core

- macOS (Homebrew) / Linux (`install/install.sh`)
- [GNU Stow](https://www.gnu.org/software/stow/)
- **Wezterm**
- **Neovim** (0.10+)
- **VS Code**

#### Environment Managers

- **UV**: Python package and version manager
- **Bob**: Neovim version manager
- **Bun**: Fast JavaScript all-in-one toolkit

#### Modern CLI Apps

- **Zoxide**: A smarter cd command (`z`)
- **Fzf**: A command-line fuzzy finder (`fzf-tab` integrated)
- **Bat**: A cat clone with syntax highlighting and Git integration
- **LSD**: The next generation `ls` command

#### Experimental (WIP)

- **Zed**: Editor settings & keymap (`stow zed`)
- **Antigravity (VS Code fork)**: Managed via `stow vscode`, targets `~/.antigravity/`
- **IdeaVim**: `.ideavimrc` via `stow ideavim`

# Usage

Clone this repository to `~/dotfiles` and use `stow` to symlink configurations.

```zsh
cd ~/dotfiles

stow nvim     # Neovim
stow zsh      # Zsh
stow wezterm  # Wezterm
stow vscode   # VS Code
stow git      # Git
stow fzf      # Fzf
```

### Linux Install

```zsh
cd ~/dotfiles/install
./install.sh          # interactive profile selection
./install.sh lite     # server/VM baseline
./install.sh full     # full dev environment
```

### Profile System

| Profile | Description |
|---------|-------------|
| `lite`  | Baseline — zsh, nvim, fzf, zoxide, lsd, bat, ripgrep |
| `full`  | `lite` + rust, node, python, java, go |

macOS defaults to `full`. Linux defaults to `lite`.
Override via `export DOTFILES_PROFILE=lite`.
