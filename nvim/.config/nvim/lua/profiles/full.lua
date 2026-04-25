-- Full profile: 메인 개발 환경 (LSP, DAP, AI 전체 지원)

require("config.colorscheme")
require("config.options")
require("config.keymaps")

require("pack.pack-manager")

-- Syntax
require("plugins.syntaxtree.treesitter")

-- Fuzzy finder
require("plugins.fuzzyfinder.telescope")

-- Editor
require("plugins.editor.surround")
require("plugins.editor.autopair")
require("plugins.editor.comment")
require("plugins.editor.indent-blankline")
require("plugins.editor.todo-comments")
require("plugins.editor.undotree")

-- UI / decorator
require("plugins.decorator.alpha-nvim")
require("plugins.decorator.lualine")

-- Auto completion
require("plugins.autocompletion.blink-cmp")

-- Formatter
require("plugins.formatter.conform")

-- Explorer
require("plugins.explorer.neo-tree")

-- Git
require("plugins.git.diffview")

-- Terminal
require("plugins.terminal.toggleterm")

-- Util
require("plugins.util.fidget")
require("plugins.util.harpoon2")
require("plugins.util.live-preview")
require("plugins.util.markview")
require("plugins.util.smart-splits")
require("plugins.util.which-key")
require("plugins.util.dropbar")

-- AI
require("ai._99")
require("ai.claude-preview")

-- DB
require("db.nvim-dbee")

-- LSP
require("lsp.lsp-configs")
require("lsp.nvim-dap")
require("lsp.nvim-java")
require("lsp.nvim-neotest")
require("lsp.java-helpers")
