#!/bin/bash
set -e

echo "=========================================="
echo "  Installing uv (Python Manager)"
echo "=========================================="

# Install uv
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Source the environment
if [ -f "$HOME/.local/bin/env" ]; then
    source "$HOME/.local/bin/env"
fi

# Add to PATH for verification
export PATH="$HOME/.local/bin:$PATH"

# Verify installation
echo "Verifying uv installation..."
uv --version

echo ""
echo "✓ uv installed successfully!"
echo "  Location: ~/.local/bin/uv"
echo ""
