#!/bin/bash
set -e

echo "=========================================="
echo "  Installing zoxide"
echo "=========================================="

# Download and install zoxide
echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Add to PATH temporarily for verification
export PATH="$HOME/.local/bin:$PATH"

# Verify installation
echo "Verifying zoxide installation..."
zoxide --version

echo ""
echo "✓ zoxide installed successfully!"
echo "  Location: ~/.local/bin/zoxide"
echo ""
