# zsh

Minimalist zsh configuration. Modular by design — each concern lives in its own file under `.zsh/`.

## Module Structure

| File | Description |
|------|-------------|
| `detect.zsh` | OS and profile detection (loaded first) |
| `path.zsh` | `$PATH` setup |
| `plugins.zsh` | Plugin management via `zplug` |
| `env.zsh` | Environment variables and shell integrations |
| `history.zsh` | History settings |
| `completion.zsh` | Tab completion with `fzf-tab` |
| `keybinds.zsh` | Key bindings |
| `aliases.zsh` | Aliases |
| `functions.zsh` | Shell functions |

## Profile System

| Profile | Default | Description |
|---------|---------|-------------|
| `lite` | Linux | Baseline — minimal tooling for server/remote environments |
| `full` | macOS | Full dev environment with all integrations enabled |

Override with `export DOTFILES_PROFILE=lite`.

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
