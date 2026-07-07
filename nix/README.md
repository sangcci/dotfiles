# nix

[nix-darwin](https://github.com/nix-darwin/nix-darwin) configuration.

| Path | Description |
|------|-------------|
| `.config/nix/flake.nix` | nix-darwin flake entry point |
| `.config/nix/flake.lock` | Locked input revisions |
| `.config/nix/modules/common/` | Common packages, languages, editor defaults |
| `.config/nix/modules/darwin/` | macOS system defaults, fonts, Homebrew, packages |

Current Darwin host defined in `flake.nix`: `Hyeoks-MacBook-Pro`.

Homebrew is used mainly for GUI apps and macOS-specific packages; common CLI tools are kept in Nix where practical.
