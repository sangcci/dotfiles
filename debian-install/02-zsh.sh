#!/bin/bash
set -e

echo "=========================================="
echo "  Installing Zsh"
echo "=========================================="

# Install zsh
echo "Installing zsh..."
sudo apt install -y zsh

# Verify installation
echo "Verifying zsh installation..."
zsh --version

echo ""
echo "✓ Zsh installed successfully!"
echo ""
echo "Note: To change your default shell to zsh, run:"
echo "  chsh -s \$(which zsh)"
echo ""
