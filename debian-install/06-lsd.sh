#!/bin/bash
set -e

echo "=========================================="
echo "  Installing lsd"
echo "=========================================="

# Download latest lsd release
echo "Fetching latest lsd version..."
LSD_VERSION=$(curl -s https://api.github.com/repos/lsd-rs/lsd/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')

echo "Downloading lsd v${LSD_VERSION}..."
wget https://github.com/lsd-rs/lsd/releases/download/v${LSD_VERSION}/lsd_${LSD_VERSION}_amd64.deb

# Install lsd
echo "Installing lsd..."
sudo dpkg -i lsd_${LSD_VERSION}_amd64.deb

# Clean up
echo "Cleaning up..."
rm lsd_${LSD_VERSION}_amd64.deb

# Verify installation
echo "Verifying lsd installation..."
lsd --version

echo ""
echo "✓ lsd installed successfully!"
echo ""
