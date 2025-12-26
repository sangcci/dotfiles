#!/bin/bash
set -e

echo "=========================================="
echo "  Installing Node.js and tree-sitter-cli"
echo "=========================================="

# Install Node.js and npm
echo "Installing Node.js LTS..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js installation
echo "Verifying Node.js installation..."
node --version
npm --version

# Install tree-sitter-cli globally
echo "Installing tree-sitter-cli..."
npm install -g tree-sitter-cli

# Verify tree-sitter installation
echo "Verifying tree-sitter installation..."
tree-sitter --version

echo ""
echo "✓ Node.js and tree-sitter-cli installed successfully!"
echo "  Node binary: /usr/bin/node"
echo "  NPM binary: /usr/bin/npm"
echo "  NPM global packages: $(npm config get prefix)/bin"
echo ""
echo "PATH configuration:"
echo "  Node.js is automatically added to PATH via apt installation"
echo "  For npm global packages, add to your shell config (~/.zshrc or ~/.bashrc):"
echo "    export PATH=\"\$(npm config get prefix)/bin:\$PATH\""
echo ""
