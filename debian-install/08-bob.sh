#!/bin/bash
set -e

echo "=========================================="
echo "  Installing bob (Neovim Version Manager)"
echo "=========================================="

# Ensure cargo is in PATH
if ! command -v cargo &> /dev/null; then
    echo "Error: Rust/Cargo not found. Please run 07-rust.sh first."
    exit 1
fi

# Source cargo environment if needed
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
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
