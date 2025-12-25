#!/bin/bash
set -e

echo "=========================================="
echo "  Installing SDKMan (Java/JDK Manager)"
echo "=========================================="

# Check if SDKMan is already installed
if [ -d "$HOME/.sdkman" ]; then
    echo "SDKMan is already installed!"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk version
    exit 0
fi

# Install SDKMan
echo "Installing SDKMan..."
curl -s "https://get.sdkman.io" | bash

# Source SDKMan
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Verify installation
echo "Verifying SDKMan installation..."
sdk version

echo ""
echo "✓ SDKMan installed successfully!"
echo ""
echo "Optional: To install Java, run:"
echo "  source ~/.sdkman/bin/sdkman-init.sh"
echo "  sdk install java"
echo ""
