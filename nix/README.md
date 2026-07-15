# nix

[nix-darwin](https://github.com/nix-darwin/nix-darwin) configuration.

| Path | Description |
|------|-------------|
| `.config/nix/flake.nix` | nix-darwin flake entry point |
| `.config/nix/flake.lock` | Locked input revisions |
| `.config/nix/modules/home/common.nix` | Cross-platform Home Manager packages and dotfile links |
| `.config/nix/modules/home/darwin.nix` | macOS Home Manager user and dotfiles |
| `.config/nix/modules/home/linux.nix` | Debian WSL Home Manager user settings |
| `.config/nix/modules/darwin/` | macOS system defaults, fonts, Homebrew, and system packages |

Current Darwin host defined in `flake.nix`: `Hyeoks-MacBook-Pro`.

The flake also provides the standalone Home Manager profile `sangcci@debian-wsl` for Debian on WSL. It imports the same cross-platform Home Manager module as macOS, then adds Linux-specific user settings. It manages the Linux user environment, not the Debian/WSL operating system itself.

## Debian WSL

Clone this repository inside the WSL Linux home directory (for example, `~/dotfiles`), not under `/mnt/c`. After installing Nix and Home Manager, apply the profile with:

```bash
home-manager switch --flake ~/dotfiles/nix/.config/nix#sangcci@debian-wsl
```

The profile installs the shared CLI/development packages and creates out-of-store symlinks for Git, Neovim, Zsh, fzf, bat, yazi, and the Nix configuration. It deliberately excludes macOS-only settings such as AeroSpace and JankyBorders.

Homebrew is used mainly for GUI apps and macOS-specific packages; common CLI tools are kept in Nix where practical.
