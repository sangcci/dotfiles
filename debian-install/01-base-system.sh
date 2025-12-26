#!/bin/bash
set -e

echo "=========================================="
echo "  Installing Base System Packages"
echo "=========================================="

# Update package list
echo "Updating package list..."
sudo apt update && sudo apt upgrade -y

# Install essential build tools and utilities
echo "Installing essential tools..."
sudo apt install -y \
    git \
    curl \
    wget \
    build-essential \
    stow \
    zip \
    unzip \
    ripgrep \
    fd-find \
    cmake \
    pkg-config \
    libtool \
    ninja-build \
    gettext \
    htop \
	bat \
	dysk

echo ""
echo "✓ Base system packages installed successfully!"
echo ""

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
