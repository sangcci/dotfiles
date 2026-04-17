# install

Linux dotfiles installer. macOS relies on Homebrew directly.

## Usage

```sh
./install.sh
```

Installs: zsh · zplug · fzf · zoxide · lsd · rust · neovim (via bob) · dotfiles (stow)

## Structure

```
install/
 ├── install.sh          entry point
 ├── lib/
 │    ├── detect.sh      OS/arch/package-manager detection
 │    ├── pkg.sh         package install abstraction (apt/pacman/dnf)
 │    └── utils.sh       logging helpers
 ├── modules/            per-tool install scripts
 │    ├── zsh.sh
 │    ├── zplug.sh
 │    ├── fzf.sh
 │    ├── zoxide.sh
 │    ├── lsd.sh
 │    ├── rust.sh        (via rustup — bob dependency)
 │    ├── neovim.sh      (via bob, nightly)
 │    └── dotfiles.sh    stow symlink setup
 └── packages/
      └── lite.sh        install sequence
```

## Supported Distros

| Distro | Package Manager |
|--------|----------------|
| Debian / Ubuntu | apt |
| Arch / Manjaro | pacman |
| Fedora / RHEL | dnf |
