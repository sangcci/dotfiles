#!/bin/bash
set -e

echo "=========================================="
echo "  Installing Rust"
echo "=========================================="

# Check if rust is already installed
if command -v cargo &> /dev/null; then
    echo "Rust is already installed!"
    rustc --version
    cargo --version
    exit 0
fi

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source cargo environment
source "$HOME/.cargo/env"

# Verify installation
echo "Verifying Rust installation..."
rustc --version
cargo --version

echo ""
echo "✓ Rust installed successfully!"
echo ""
echo "Note: Restart your shell or run:"
echo "  source \$HOME/.cargo/env"
echo ""
