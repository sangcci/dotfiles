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
echo "  Cargo binary: $HOME/.cargo/bin/cargo"
echo "  Rustc binary: $HOME/.cargo/bin/rustc"
echo ""
echo "PATH configuration:"
echo "  Rust automatically adds the following to your shell config:"
echo "    export PATH=\"\$HOME/.cargo/bin:\$PATH\""
echo ""
echo "To activate Rust in the current shell:"
echo "  source \$HOME/.cargo/env"
echo ""
