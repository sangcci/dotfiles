# Introduction

This is my personal dotfiles managed by GNU Stow. It pursues extreme minimalism and efficiency.

Primarily optimized for **macOS**, with Linux support via the `install/` script.

# Features

- **Neovim**: Highly customized setup with full LSP, debugging, and plugin ecosystem.
- **Kitty**: GPU-accelerated terminal with modular configuration.
  > **Note (macOS 26):** Ghostty exhibits abnormally high CPU usage on macOS 26, causing rapid battery drain. Kitty is unaffected.
- **Zsh**: Minimalist setup with essential plugins via `zplug` and modern CLI alternatives.
- **Pre-configured LSP & Debugging**: Ready-to-use development environment.
- **Visuals**: Kanso Ink theme.
- **Fonts**: **D2CodingLigature Nerd Font** (coding & terminal), **Pretendard** (system/UI default).

### Requirements & Toolkit

#### Core

- macOS (Homebrew) / Linux (`install/install.sh`)
- [GNU Stow](https://www.gnu.org/software/stow/)
- **Kitty** — primary terminal
- **Neovim** (0.12+)

#### Environment Managers

- **UV**: Python package and version manager
- **Bob**: Neovim version manager
- **Bun**: Fast JavaScript all-in-one toolkit

#### Modern CLI Apps

- **Zoxide**: A smarter cd command (`z`)
- **Fzf**: A command-line fuzzy finder (`fzf-tab` integrated)
- **Bat**: A cat clone with syntax highlighting and Git integration
- **LSD**: The next generation `ls` command
- **Yazi**: Terminal file manager (primary), Finder (fallback)

#### macOS Apps

| Category        | Tool                                     | Notes                                  |
|-----------------|------------------------------------------|----------------------------------------|
| Terminal        | **Kitty** / Ghostty                      | Ghostty has high CPU usage on macOS 26 |
| Browser         | **Safari** (main), **Brave** (dev)       |                                        |
| Code Editor     | **Neovim** (0.12+)                       | VS Code not used                       |
| File Manager    | **Yazi** (main), Finder (sub)            |                                        |
| Window Manager  | **Aerospace**                            |                                        |
| Clipboard       | **Clippy**, **Command X**                |                                        |
| Menu Bar Hide   | **Thaw**                                 |                                        |
| Notes           | **Obsidian**, **Anki**, **Notion**       |                                        |
| LLM CLI         | **Claude Code**, **Gemini CLI**, Codex   | Codex API changes frequently           |
| Utility         | **FOCD**                                 | Removes Korean/English input switch delay |
| Monitoring      | **RunCat**, **htop**                     |                                        |
| Container       | **Docker**, **Colima**, **Testcontainers Desktop** |                             |

# Usage

Clone this repository to `~/dotfiles` and use `stow` to symlink configurations.

```zsh
cd ~/dotfiles

stow nvim      # Neovim
stow zsh       # Zsh
stow kitty     # Kitty terminal
stow git       # Git
stow fzf       # Fzf
stow yazi      # Yazi file manager
stow aerospace # Aerospace window manager
stow obsidian  # Obsidian
```

For Linux installation and profile system, see [install/README.md](install/README.md).
