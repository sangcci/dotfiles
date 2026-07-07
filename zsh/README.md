# zsh

Minimalist zsh configuration. Modular by design — zsh core stays small, and tool-specific setup lives under `plugins/`.

## Architecture

`.zshrc` is the single entry point. Core modules load first, tool plugins load next, and key bindings load last so plugin-provided widgets are available.

```
.zshrc
 │
 ├── core/detect.zsh       → DOTFILES_OS
 ├── core/lib.zsh          shared helpers and plugin loader
 │
 ├── core/path.zsh         common $PATH
 ├── core/env.zsh          EDITOR, VISUAL, common shell env
 ├── core/history.zsh      history options
 ├── core/completion.zsh   base completion styles
 ├── core/aliases.zsh      common aliases
 ├── core/functions.zsh    common functions
 │
 ├── core/plugin-list.zsh  ordered plugin list
 ├── plugins/*.zsh         tool-specific setup, skipped safely when unavailable
 │
 └── core/keybinds.zsh     guarded bindkey setup
```

## Directory layout

```
zsh/.zsh/
 ├── core/
 │   ├── aliases.zsh
 │   ├── completion.zsh
 │   ├── detect.zsh
 │   ├── env.zsh
 │   ├── functions.zsh
 │   ├── history.zsh
 │   ├── keybinds.zsh
 │   ├── lib.zsh
 │   ├── path.zsh
 │   └── plugin-list.zsh
 └── plugins/
     ├── antigravity.zsh
     ├── bun.zsh
     ├── cli.zsh
     ├── docker.zsh
     ├── envman.zsh
     ├── fzf-git.zsh
     ├── fzf.zsh
     ├── npm.zsh
     ├── postgresql.zsh
     ├── sdkman.zsh
     ├── uv.zsh
     ├── yazi.zsh
     ├── zoxide.zsh
     └── zplug.zsh
```

## Plugin loading

Plugins are listed in `core/plugin-list.zsh`:

```zsh
DOTFILES_PLUGINS=(
  zplug
  zoxide
  fzf
  fzf-git
  cli
  bun
  uv
  sdkman
  envman
  docker
  npm
  postgresql
  yazi
  antigravity
)
```

Each plugin owns one tool or integration and guards itself with `command -v`, file checks, or OS checks. Missing tools should not abort shell startup.

## Core helpers

`core/lib.zsh` provides:

| Helper | Description |
|--------|-------------|
| `_dotfiles_prepend_path` | Adds an existing directory to the front of `$PATH` while keeping entries unique |
| `_dotfiles_source_if_exists` | Sources a file only when it exists and is non-empty |
| `_dotfiles_load_plugin` | Sources one plugin from `plugins/` |
| `_dotfiles_load_plugins` | Loads `DOTFILES_PLUGINS` in order |

## OS Gate

```
DOTFILES_OS
 ├── macos            Homebrew paths · localip via ipconfig
 ├── debian/ubuntu    apt-based Linux
 ├── arch/manjaro     Arch-based Linux
 └── linux            generic fallback
```

## zplug plugins

Managed via [zplug](https://github.com/zplug/zplug). If zplug is not installed, plugin loading is skipped with a warning instead of aborting shell startup.

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
| `Ctrl+Space` / `Ctrl+f` | Accept autosuggestion, when autosuggestions are loaded |
| `Ctrl+p` | History search up, when history-substring-search is loaded |
| `Ctrl+n` | History search down, when history-substring-search is loaded |
| `Tab` | fzf-tab item select |

## Notable Aliases / Functions

| Alias / Function | Source | Note |
|------------------|--------|------|
| `n` | `plugins/cli.zsh` | `nvim`, when installed |
| `ls` / `ll` / `lt` | `plugins/cli.zsh` | `lsd`, when installed |
| `cat` | `plugins/cli.zsh` | `bat` / `batcat`, when installed |
| `..` / `...` / `....` | `plugins/zoxide.zsh` | `z` navigation, falls back to `cd` |
| `c` | `core/aliases.zsh` | `clear` |
| `myip` | `core/aliases.zsh` | Shows public IPv4 and IPv6 |
| `y` | `plugins/yazi.zsh` | yazi wrapper that `cd`s into the directory yazi exits in |

## Docker / Testcontainers

`plugins/docker.zsh` exports `DOCKER_HOST=unix://$HOME/.colima/default/docker.sock` on macOS when the Colima socket exists and `DOCKER_HOST` is not already set. This keeps JVM tools such as Testcontainers from falling back to a missing `/var/run/docker.sock`.
