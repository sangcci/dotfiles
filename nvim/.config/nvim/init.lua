require("config.colorscheme")
require("config.options")
require("config.keymaps")

require("pack.pack-ui")

-- Syntax
require("plugins.syntaxtree.treesitter")

-- Fuzzy finder
require("plugins.fuzzyfinder.telescope")

-- Editor
require("plugins.editor.surround")
require("plugins.editor.autopair")
require("plugins.editor.comment")
require("plugins.editor.indent-blankline")
require("plugins.editor.undotree")

-- UI / decorator
require("plugins.decorator.alpha-nvim")
require("plugins.decorator.lualine")

-- Auto completion
require("plugins.autocompletion.blink-cmp")

-- Formatter
require("plugins.formatter.conform")

-- Explorer
require("plugins.explorer.canola")

-- Git
require("plugins.git.diffview")
require("plugins.git.gitsigns")
require("plugins.git.neogit")

-- Terminal
require("plugins.terminal.toggleterm")

-- Util
require("plugins.util.fidget")
require("plugins.util.live-preview")
require("plugins.util.markview")
require("plugins.util.smart-splits")
require("plugins.util.which-key")
require("plugins.util.dropbar")

-- AI
require("ai.code-preview")

-- DB
require("db.nvim-dbee")

-- LSP
require("lsp.lsp-configs")
require("lsp.nvim-dap")
require("lsp.nvim-jdtls")
require("lsp.kotlin-nvim")
require("lsp.nvim-neotest")
require("lsp.sonarlint")
