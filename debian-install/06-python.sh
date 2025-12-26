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
echo "✓ uv (Python Manager) installed successfully!"
echo "  UV binary: $HOME/.local/bin/uv"
echo ""
echo "PATH configuration:"
echo "  Add to your shell config (~/.zshrc or ~/.bashrc):"
echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
echo "Additional configuration (optional):"
echo "  If uv provides an env file, source it:"
echo "    [ -f \"\$HOME/.local/bin/env\" ] && . \"\$HOME/.local/bin/env\""
echo ""
