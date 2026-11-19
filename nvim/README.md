# nvim

Neovim configuration for 0.12+. Uses the built-in `vim.pack` package manager.

## Overview

Neovim loads a single full configuration from `init.lua`. There is no separate profile switch; LSP, completion, formatter, git, and utility plugins are all part of the default setup. Tests, debugging, and database work run from the terminal instead.

## Structure

```text
nvim/.config/nvim/
├── init.lua                entry point and main plugin/config loader
├── lsp/                    per-server LSP configs
│   ├── lua_ls.lua
│   ├── pyright.lua
│   └── ts_ls.lua
├── lua/
│   ├── config/             colorscheme · options · keymaps
│   ├── lsp/                mason · LSP · Java · Kotlin · sonarlint
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
│       └── util/
└── nvim-pack-lock.json     vim.pack lockfile
```

## Main plugin areas

| Area | Notable plugins/config |
|------|------------------------|
| Completion | blink.cmp, blink.compat, blink-emoji, friendly-snippets |
| LSP / tools | mason.nvim, mason-lspconfig, mason-tool-installer, nvim-lspconfig |
| Java / Kotlin | nvim-jdtls, kotlin.nvim, sonarlint.nvim |
| Editor | treesitter, conform, autopairs, surround, Comment.nvim, indent-blankline, undotree |
| Finder | telescope.nvim, telescope-cmdline.nvim |
| Explorer | neo-tree.nvim |
| Git | diffview.nvim, gitsigns.nvim |
| UI / utils | alpha-nvim, slimline.nvim, which-key, fidget, dropbar, smart-splits |
| Markdown preview | peek.nvim, vellum.nvim |

## Notes

- Plugin specs are declared close to each plugin config via `vim.pack.add`.
- `nvim-pack-lock.json` tracks resolved plugin revisions.
- Git: `<leader>gg` opens Diffview; `<leader>gc` closes it; `<leader>gh` opens history; `<leader>gf` opens current file history; `<leader>gr` reviews the current branch against its PR base branch (or the default branch when there is no PR) with LSP available on the right side.
