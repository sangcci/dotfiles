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
require("plugins.explorer.oil")

-- Git
require("plugins.git.diffview")

-- Terminal
require("plugins.terminal.floaterm")

-- Util
require("plugins.util.fidget")
require("plugins.util.harpoon2")
require("plugins.util.live-preview")
require("plugins.util.markview")
require("plugins.util.navigator")
require("plugins.util.render-markdown")
require("plugins.util.which-key")

-- AI
require("ai.copilot")
require("ai.claude-preview")

-- DB
require("db.nvim-dbee")

-- LSP
require("lsp.lsp-configs")
require("lsp.nvim-dap")
-- require("lsp.nvim-jdtls")
require("lsp.nvim-java")
-- require("lsp.nvim-jls")
require("lsp.nvim-neotest")
