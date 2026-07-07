# nvim

Neovim configuration for 0.12+. Uses the built-in `vim.pack` package manager.

## Overview

Neovim loads a single full configuration from `init.lua`. There is no separate profile switch; LSP, DAP, completion, formatter, git, DB, AI, and utility plugins are all part of the default setup.

## Structure

```text
nvim/.config/nvim/
├── init.lua                entry point and main plugin/config loader
├── lsp/                    per-server LSP configs
│   ├── lua_ls.lua
│   ├── pyright.lua
│   └── ts_ls.lua
├── lua/
│   ├── ai/                 code-preview integration
│   ├── config/             colorscheme · options · keymaps
│   ├── db/                 nvim-dbee
│   ├── lsp/                mason · LSP · DAP · Java · Kotlin · neotest · sonarlint
│   ├── pack/               vim.pack helpers
│   └── plugins/            plugin configs by category
│       ├── autocompletion/
│       ├── decorator/
│       ├── editor/
│       ├── explorer/
│       ├── formatter/
│       ├── fuzzyfinder/
│       ├── git/
│       ├── syntaxtree/
│       ├── terminal/
│       └── util/
└── nvim-pack-lock.json     vim.pack lockfile
```

## Main plugin areas

| Area | Notable plugins/config |
|------|------------------------|
| Completion | blink.cmp, blink.compat, blink-emoji, friendly-snippets |
| LSP / tools | mason.nvim, mason-lspconfig, mason-tool-installer, nvim-lspconfig |
| Debugging | nvim-dap, mason-nvim-dap, nvim-dap-virtual-text, nvim-dap-view |
| Java / Kotlin | nvim-jdtls, java-helpers, kotlin.nvim |
| Tests | neotest with Java, Python, Go adapters |
| Editor | treesitter, conform, autopairs, surround, Comment.nvim, indent-blankline, undotree |
| Finder | telescope.nvim, telescope-cmdline.nvim |
| Explorer | canola.nvim / oil-style explorer config |
| Git | diffview.nvim, gitsigns.nvim, neogit |
| UI / utils | alpha-nvim, lualine, which-key, fidget, dropbar, markview, smart-splits |
| Terminal / preview | toggleterm.nvim, live-preview.nvim |
| DB | nvim-dbee |
| AI | code-preview.nvim |

## Notes

- Plugin specs are declared close to each plugin config via `vim.pack.add`.
- `nvim-pack-lock.json` tracks resolved plugin revisions.
