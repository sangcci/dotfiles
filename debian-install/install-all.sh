#!/bin/bash
set -e

echo "=========================================="
echo "  Debian Dotfiles Installation"
echo "  This will install all required tools"
echo "=========================================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Array of scripts to run in order
SCRIPTS=(
    "01-base-system.sh"
    "02-zsh.sh"
    "03-zplug.sh"
    "04-fzf.sh"
    "05-zoxide.sh"
    "06-lsd.sh"
    "07-rust.sh"
    "08-bob.sh"
    "09-neovim.sh"
    "10-nodejs.sh"
    "11-uv.sh"
    "12-sdkman.sh"
    "13-setup-dotfiles.sh"
)

# Counter for progress
TOTAL=${#SCRIPTS[@]}
CURRENT=0

# Run each script
for script in "${SCRIPTS[@]}"; do
    CURRENT=$((CURRENT + 1))
    echo ""
    echo "=========================================="
    echo "  Progress: [$CURRENT/$TOTAL] Running $script"
    echo "=========================================="
    echo ""

    # Make sure script is executable
    chmod +x "$SCRIPT_DIR/$script"

    # Run the script
    if bash "$SCRIPT_DIR/$script"; then
        echo ""
        echo "✓ $script completed successfully"

        # Source cargo environment after installing Rust
        if [ "$script" = "07-rust.sh" ]; then
            if [ -f "$HOME/.cargo/env" ]; then
                echo "Sourcing Rust environment..."
                source "$HOME/.cargo/env"
            fi
        fi
    else
        echo ""
        echo "✗ $script failed!"
        echo "Please fix the error and rerun the script."
        exit 1
    fi
done

echo ""
echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Change default shell to zsh:"
echo "     chsh -s \$(which zsh)"
echo ""
echo "  2. Log out and log back in"
echo ""
echo "  3. Open a new terminal and zsh will load your configuration"
echo ""
echo "  4. Open Neovim to install plugins:"
echo "     nvim"
echo ""
echo "Enjoy your new environment!"
echo ""
