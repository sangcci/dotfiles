#!/bin/bash
set -e

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
        echo "Error: bob not found. Please run 08-bob.sh first."
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
