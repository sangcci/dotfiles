# install

Linux dotfiles installer. macOS relies on Homebrew directly.

## Usage

```sh
./install.sh          # interactive profile selection
./install.sh lite     # server/VM baseline
./install.sh full     # full dev environment
```

## Structure

```
install/
 ├── install.sh          entry point
 ├── lib/
 │    ├── detect.sh      OS/arch/package-manager detection
 │    ├── pkg.sh         package install abstraction (apt/pacman/dnf)
 │    └── utils.sh       logging helpers
 ├── modules/            per-tool install scripts
 │    ├── neovim.sh      (via bob)
 │    ├── rust.sh        (via rustup)
 │    ├── node.sh        (via fnm)
 │    ├── python.sh      (via uv)
 │    ├── java.sh        (via SDKMAN)
 │    ├── go.sh
 │    ├── fzf.sh
 │    ├── zoxide.sh
 │    ├── lsd.sh
 │    ├── zsh.sh
 │    └── dotfiles.sh    stow symlink setup
 └── packages/
      ├── lite.sh        package list for lite profile
      └── full.sh        package list for full profile
```

## Profiles

| Profile | Description |
|---------|-------------|
| `lite` | zsh, nvim, fzf, zoxide, lsd, bat, ripgrep |
| `full` | `lite` + rust, node, python, java, go |
