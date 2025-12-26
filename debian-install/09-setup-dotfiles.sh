#!/bin/bash
set -e

echo "=========================================="
echo "  Setting up Dotfiles with Stow"
echo "=========================================="

# Ensure we're in the dotfiles directory
cd ~/dotfiles

# Backup existing .zshrc if it exists
if [ -f ~/.zshrc ]; then
    echo "Backing up existing .zshrc to ~/.zshrc.backup"
    mv ~/.zshrc ~/.zshrc.backup
fi

# Copy Debian-compatible .zshrc to zsh directory
echo "Setting up Debian-compatible .zshrc..."
cp debian-install/.zshrc-debian zsh/.zshrc

# Use stow to create symlinks
echo "Creating symlinks with stow..."

# Stow zsh configuration
stow -v zsh

# Stow nvim configuration
stow -v nvim

# Stow git configuration
stow -v git

echo ""
echo "✓ Dotfiles setup complete!"
echo ""
echo "Symlinks created:"
echo "  ~/.zshrc -> ~/dotfiles/zsh/.zshrc"
echo "  ~/.config/nvim -> ~/dotfiles/nvim/.config/nvim"
echo "  ~/.gitignore_global -> ~/dotfiles/git/.gitignore_global"
echo ""
echo "Note: To activate zsh configuration, run:"
echo "  source ~/.zshrc"
echo ""
