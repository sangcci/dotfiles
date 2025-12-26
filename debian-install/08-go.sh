#!/bin/bash
set -e

echo "=========================================="
echo "  Installing Go"
echo "=========================================="

# Check if Go is already installed
if command -v go &> /dev/null; then
    echo "Go is already installed!"
    go version
    exit 0
fi

# Determine the latest Go version or use a stable version
GO_VERSION="1.25.5"  # Update this to the desired version
GO_TARBALL="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TARBALL}"

# Download Go
echo "Downloading Go ${GO_VERSION}..."
cd /tmp
wget -q --show-progress "${GO_URL}"

# Remove any previous Go installation
if [ -d "/usr/local/go" ]; then
    echo "Removing previous Go installation..."
    sudo rm -rf /usr/local/go
fi

# Extract Go to /usr/local
echo "Installing Go to /usr/local/go..."
sudo tar -C /usr/local -xzf "${GO_TARBALL}"

# Clean up
rm "${GO_TARBALL}"

# Add Go to PATH for this session
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Verify installation
echo "Verifying Go installation..."
go version

echo ""
echo "✓ Go installed successfully!"
echo "  Go binary: /usr/local/go/bin/go"
echo "  GOPATH: $HOME/go (default)"
echo ""
echo "PATH configuration:"
echo "  Add to your shell config (~/.zshrc or ~/.bashrc):"
echo "    export PATH=\"/usr/local/go/bin:\$PATH\""
echo "    export PATH=\"\$HOME/go/bin:\$PATH\""
echo ""
