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
    gettext

echo ""
echo "✓ Base system packages installed successfully!"
echo ""
