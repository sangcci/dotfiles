# zsh

Minimalist zsh configuration. Modular by design — each concern lives in its own file under `.zsh/`.

## Architecture

`.zshrc` is the single entry point. Modules load sequentially; earlier modules set variables that later ones depend on.

```
.zshrc
 │
 ├── [1] detect.zsh      → DOTFILES_OS, DOTFILES_PROFILE, NVIM_PROFILE
 │                                │
 │         ┌──────────────────────┤ consumed by all modules below
 │         ▼                      ▼
 ├── [2] path.zsh         $PATH (OS-specific + profile-gated)
 ├── [3] plugins.zsh      zplug
 ├── [4] env.zsh          EDITOR, shell integrations  (must follow path.zsh)
 ├── [5] history.zsh      setopt
 ├── [6] completion.zsh   fzf-tab, completion styles
 ├── [7] keybinds.zsh     bindkey
 ├── [8] aliases.zsh      aliases  (OS-gated + profile-gated)
 └── [9] functions.zsh    shell functions  (profile-gated)
```

### Profile Gate

```
DOTFILES_PROFILE
 ├── lite  (Linux default)   core tooling only
 └── full  (macOS default)   + SDKMAN · uv · bun · npm global · postgresql
```

Override: `export DOTFILES_PROFILE=lite`

### OS Gate

```
DOTFILES_OS
 ├── macos            Homebrew paths · localip via ipconfig
 ├── debian/ubuntu    apt-based Linux
 ├── arch/manjaro     Arch-based Linux
 └── linux            generic fallback
```

## Plugins

Managed via [zplug](https://github.com/zplug/zplug).

| Plugin | Description |
|--------|-------------|
| [pure](https://github.com/sindresorhus/pure) | Minimal async prompt |
| [zsh-transient-prompt](https://github.com/olets/zsh-transient-prompt) | Collapses prompt after command execution |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Fish-like syntax highlighting |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | History-based inline suggestions |
| [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) | Up/down search through history by substring |
| [zsh-completions](https://github.com/zsh-users/zsh-completions) | Additional completion definitions |
| [fzf-tab](https://github.com/Aloxaf/fzf-tab) | Replace zsh completion menu with fzf |
| [git (oh-my-zsh)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) | Git aliases and helpers |

## Key Bindings

| Key | Action |
|-----|--------|
| `Ctrl+Space` / `Ctrl+f` | Accept autosuggestion |
| `Ctrl+p` | History search up |
| `Ctrl+n` | History search down |
| `Tab` | fzf-tab item select |

## Notable Aliases

| Alias | Command | Note |
|-------|---------|------|
| `n` | `nvim` | |
| `ls` / `ll` / `lt` | `lsd` | Falls back to system `ls` |
| `cat` | `bat` | Falls back to system `cat` |
| `c` | `clear` | |
| `myip` | `curl ifconfig.me` | Shows public IPv4 and IPv6 |
| `y` | yazi wrapper | `cd`s into the directory yazi exits in |
