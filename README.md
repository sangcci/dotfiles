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

### Neovim Plugins

> Plugin manager: built-in `vim.pack` (Neovim 0.12+)

#### Completion

| Plugin | Description |
|--------|-------------|
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Fast, async completion engine |
| [blink.compat](https://github.com/saghen/blink.compat) | nvim-cmp source compatibility layer |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection |
| [blink-emoji.nvim](https://github.com/moyiz/blink-emoji.nvim) | Emoji completion source |

#### LSP & Debugging

| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/DAP/linter installer |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Mason ↔ lspconfig bridge |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install tools via Mason |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Mason ↔ DAP bridge |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Inline DAP variable display |
| [nvim-dap-view](https://github.com/igorlfs/nvim-dap-view) | DAP UI panels |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress notifications |
| [neotest](https://github.com/nvim-neotest/neotest) | Test runner framework |

#### Java

| Plugin | Description |
|--------|-------------|
| [nvim-java](https://github.com/nvim-java/nvim-java) | Full Java IDE features |
| [spring-boot.nvim](https://github.com/JavaHello/spring-boot.nvim) | Spring Boot support |
| [java-helpers.nvim](https://github.com/NickJAllen/java-helpers.nvim) | Java utility helpers |

#### Editor

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax parsing & highlighting |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Treesitter-based text objects |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter integration |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto bracket/quote pairing |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround motions |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME/etc. |
| [undotree](https://github.com/mbbill/undotree) | Visual undo history |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |

#### Fuzzy Finder

| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [telescope-cmdline.nvim](https://github.com/jonarrien/telescope-cmdline.nvim) | Command-line via Telescope |

#### Explorer & Navigation

| Plugin | Description |
|--------|-------------|
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer as a buffer |
| [oil-git.nvim](https://github.com/benomahony/oil-git.nvim) | Git status in oil.nvim |
| [harpoon2](https://github.com/ThePrimeagen/harpoon) | File bookmarking & quick nav |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | Seamless split/multiplexer navigation |
| [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) | IDE-like breadcrumb bar |

#### Git

| Plugin | Description |
|--------|-------------|
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff & merge tool |

#### UI & Visuals

| Plugin | Description |
|--------|-------------|
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard / start screen |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown renderer |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown rendering (blink.cmp integration) |
| [mini.icons](https://github.com/nvim-mini/mini.icons) | Icon provider |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |

#### Terminal & Preview

| Plugin | Description |
|--------|-------------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Persistent terminal toggling |
| [live-preview.nvim](https://github.com/brianhuster/live-preview.nvim) | Live HTML/Markdown preview |

#### Database

| Plugin | Description |
|--------|-------------|
| [nvim-dbee](https://github.com/kndndrj/nvim-dbee) | Database client |

#### AI

| Plugin | Description |
|--------|-------------|
| [claude-preview.nvim](https://github.com/Cannon07/claude-preview.nvim) | Claude AI integration |

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
stow tmux      # Tmux
stow obsidian  # Obsidian
```

### Linux Install

```zsh
cd ~/dotfiles/install
./install.sh          # interactive profile selection
./install.sh lite     # server/VM baseline
./install.sh full     # full dev environment
```

### Profile System

| Profile | Description |
|---------|-------------|
| `lite`  | Baseline — zsh, nvim, fzf, zoxide, lsd, bat, ripgrep |
| `full`  | `lite` + rust, node, python, java, go |

macOS defaults to `full`. Linux defaults to `lite`.
Override via `export DOTFILES_PROFILE=lite`.
