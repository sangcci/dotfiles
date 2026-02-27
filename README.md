# Introduction

This is my personal dotfiles managed by GNU Stow. It pursues extreme minimalism and efficiency.

It's currently optimized for **macOS**.

# Features

- **Hybrid Neovim**: Shared configuration between native Neovim and VS Code (powered by `vim.g.vscode`).
- **VS Code / Antigravity**: Manage settings, keybindings, and extensions via Stow.
- **Wezterm**: A GPU-accelerated cross-platform terminal emulator with a flexible configuration.
- **Zsh**: Minimalist setup with essential plugins via `zplug` and modern CLI alternatives.
- **Pre-configured LSP & Debugging**: Ready-to-use development environment.
- **Visuals**: GitHub Dark theme with transparency, recommended font: **Iosevka Light**.

### Requirements & Toolkit

#### Core

- macOS (Homebrew)
- [GNU Stow](https://www.gnu.org/software/stow/)
- **Wezterm**
- **Antigravity (VS Code)**
- **Neovim** (+0.12 nightmare)

#### Environment Managers

- **SDKMan**: JDK version manager
- **UV**: Python package and version manager
- **Bob**: Neovim version manager
- **Bun**: Fast JavaScript all-in-one toolkit

#### Modern CLI Apps (Rust-powered & others)

- **Zoxide**: A smarter cd command (`z`)
- **Fzf**: A command-line fuzzy finder (`fzf-tab` integrated)
- **Bat**: A cat clone with syntax highlighting and Git integration
- **LSD**: The next generation `ls` command
- **Treesitter & Treesitter-cli**: Incremental parsing system
- **Zplug**: A next-generation plugin manager for zsh

# Usage

Clone this repository to `~/dotfiles` and use `stow` to symlink configurations.

```zsh
cd ~/dotfiles

# Link Neovim configuration
stow nvim

# Link Zsh configuration
stow zsh

# Link VS Code / Antigravity configuration
# This targets ~/Library/Application Support/Antigravity/User
stow vscode

# Link IdeaVim
stow ideavim
```

# Roadmap / Issues

- [ ] Linux support (current: macOS only)
- [ ] Better Spring Boot environment integration
- [ ] Automate requirement installation scripts
