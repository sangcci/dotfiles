#!/bin/bash
set -e

echo "=========================================="
echo "  Installing bob (Neovim Version Manager)"
echo "=========================================="

# Source cargo environment if needed
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Ensure cargo is in PATH
if ! command -v cargo &> /dev/null; then
    echo "Error: Rust/Cargo not found. Please install rust first."
    exit 1
fi

# Install bob
echo "Installing bob via cargo..."
cargo install bob-nvim

# Add bob to PATH for current session
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

echo ""
echo "✓ bob installed successfully!"
echo ""
echo "Note: bob's PATH is added in the .zshrc configuration"
echo ""

echo "=========================================="
echo "  Installing Neovim 0.12+ via bob"
echo "=========================================="

# Ensure bob is installed
if ! command -v bob &> /dev/null; then
    # Try to source cargo environment
    if [ -f "$HOME/.cargo/env" ]; then
        source "$HOME/.cargo/env"
    fi

    if ! command -v bob &> /dev/null; then
        echo "Error: bob not found. Please install bob first."
        exit 1
    fi
fi

# Install neovim nightly (0.12+)
echo "Installing Neovim nightly..."
bob install nightly

# Set nightly as default
echo "Setting nightly as default..."
bob use nightly

# Add bob's nvim to PATH
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Verify installation
echo "Verifying Neovim installation..."
nvim --version | head -n 1

echo ""
echo "✓ Neovim installed successfully!"
echo ""
