# nvim

Neovim configuration (0.12+). Uses the built-in `vim.pack` package manager.

## Profiles

```
NVIM_PROFILE
 ├── lite   core only — colorscheme, options, keymaps, treesitter, telescope,
 │          editor plugins, lualine, oil, floaterm, which-key
 └── full   lite + LSP · DAP · AI · DB · Java · all util plugins
```

Inherits `DOTFILES_PROFILE` from zsh. Override with `export NVIM_PROFILE=lite`.

## Structure

```
nvim/.config/nvim/
 ├── init.lua                entry point
 ├── lsp/                    LSP server configs
 ├── lua/
 │    ├── ai/                Claude AI integration
 │    ├── config/            colorscheme · options · keymaps
 │    ├── db/                nvim-dbee
 │    ├── lsp/               LSP · DAP · Java · neotest setup
 │    ├── pack/              vim.pack manager helpers
 │    ├── plugins/           plugin configs (grouped by category)
 │    │    ├── autocompletion/
 │    │    ├── decorator/
 │    │    ├── editor/
 │    │    ├── explorer/
 │    │    ├── formatter/
 │    │    ├── fuzzyfinder/
 │    │    ├── git/
 │    │    ├── syntaxtree/
 │    │    ├── terminal/
 │    │    └── util/
 │    └── profiles/          profile loader (full.lua · lite.lua)
 └── nvim-pack-lock.json     vim.pack lockfile
```

## Plugins

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
