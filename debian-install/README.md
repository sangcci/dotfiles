# Debian Installation Scripts

This directory contains modular installation scripts for setting up your dotfiles environment on Debian Linux (CLI).

## Quick Start

### Option 1: Run All Scripts (Automated)

```bash
cd ~/dotfiles/debian-install
chmod +x *.sh
./install-all.sh
```

### Option 2: Run Scripts Individually (Recommended)

Run each script in order:

```bash
cd ~/dotfiles/debian-install

# Make all scripts executable
chmod +x *.sh

# Run each script in order
./01-base-system.sh       # Base system packages
./02-zsh.sh               # Zsh shell
./03-zplug.sh             # Zsh plugin manager
./04-fzf.sh               # Fuzzy finder
./05-zoxide.sh            # Smart cd command
./06-lsd.sh               # Modern ls replacement
./07-rust.sh              # Rust programming language
./08-bob.sh               # Neovim version manager
./09-neovim.sh            # Neovim 0.12+
./10-nodejs.sh            # Node.js and tree-sitter-cli
./11-uv.sh                # Python manager
./12-sdkman.sh            # Java/JDK manager (optional)
./13-setup-dotfiles.sh    # Setup dotfiles with stow
```

## What Gets Installed

### Core Tools
- **git, curl, wget** - Essential utilities
- **build-essential** - Compilation tools
- **stow** - Dotfile symlink manager
- **ripgrep, fd-find** - Fast search tools

### Shell Environment
- **zsh** - Modern shell
- **zplug** - Zsh plugin manager
- **fzf** - Fuzzy finder
- **zoxide** - Smart directory navigation
- **lsd** - Modern ls with icons and colors

### Development Tools
- **Neovim 0.12+** - Modern vim
- **bob** - Neovim version manager
- **Rust** - Required for bob
- **Node.js** - JavaScript runtime
- **tree-sitter-cli** - Parser generator tool

### Version Managers (Optional)
- **uv** - Python package and version manager
- **SDKMan** - Java/JDK version manager

## Post-Installation

### 1. Change Default Shell to Zsh

```bash
chsh -s $(which zsh)
```

Log out and log back in for the change to take effect.

### 2. Configure Git (if needed)

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 3. Install Zsh Plugins

The first time you start zsh, zplug will ask if you want to install plugins. Type `y` to install.

Or manually:
```bash
zsh
zplug install
```

### 4. Install Neovim Plugins

Open Neovim and it will automatically install plugins:
```bash
nvim
```

Wait for the plugins to install, then restart Neovim.

## Troubleshooting

### Script Fails with Permission Denied
```bash
chmod +x ~/dotfiles/debian-install/*.sh
```

### zplug Not Found
```bash
source ~/.zshrc
# or restart your shell
```

### Neovim Not Found After Installation
```bash
source ~/.cargo/env
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
```

### Stow Conflicts
If stow reports conflicts, backup and remove existing config files:
```bash
mv ~/.zshrc ~/.zshrc.backup
mv ~/.config/nvim ~/.config/nvim.backup
```

Then rerun `./13-setup-dotfiles.sh`

## Optional Installations

### Install Java via SDKMan
```bash
source ~/.sdkman/bin/sdkman-init.sh
sdk install java
```

### Install Python via uv
```bash
uv python install 3.12
```

## Differences from macOS Version

- **zplug path**: Changed from `/opt/homebrew/opt/zplug` to `~/.zplug`
- **wezterm integration**: Removed (GUI-only terminal emulator)
- **localip alias**: Changed from `ipconfig getifaddr en0` to `hostname -I`
- **Node path**: Changed from `/opt/homebrew/bin/node` to `/usr/bin/node`

## Notes

- All scripts use `set -e` to exit on error
- Scripts check for existing installations where applicable
- Some scripts require previous scripts to be run first (e.g., bob requires rust)
- Each script provides verification output after installation

## Files

- `01-base-system.sh` - System packages and build tools
- `02-zsh.sh` - Zsh shell
- `03-zplug.sh` - Zsh plugin manager
- `04-fzf.sh` - Fuzzy finder
- `05-zoxide.sh` - Smart cd
- `06-lsd.sh` - Modern ls
- `07-rust.sh` - Rust toolchain
- `08-bob.sh` - Neovim version manager
- `09-neovim.sh` - Neovim installation
- `10-nodejs.sh` - Node.js and tree-sitter
- `11-uv.sh` - Python manager
- `12-sdkman.sh` - Java manager
- `13-setup-dotfiles.sh` - Dotfiles setup with stow
- `.zshrc-debian` - Debian-compatible zsh configuration
- `install-all.sh` - Run all scripts automatically
- `README.md` - This file
