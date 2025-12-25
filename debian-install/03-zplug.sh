#!/bin/bash
set -e

echo "=========================================="
echo "  Installing zplug"
echo "=========================================="

# Install zplug to ~/.zplug
echo "Installing zplug..."
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo ""
echo "✓ zplug installed successfully!"
echo "  Location: ~/.zplug"
echo ""
