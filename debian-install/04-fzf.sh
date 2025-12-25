#!/bin/bash
set -e

echo "=========================================="
echo "  Installing fzf"
echo "=========================================="

# Clone fzf
echo "Cloning fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# Install fzf
echo "Installing fzf..."
~/.fzf/install --all

echo ""
echo "✓ fzf installed successfully!"
echo ""
