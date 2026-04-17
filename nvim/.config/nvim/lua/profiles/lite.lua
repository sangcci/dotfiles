-- Lite profile: light configs (server, remote env)
-- No LSP, DAP, AI, DB, some Utils

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
require("plugins.editor.undotree")

-- UI
require("plugins.decorator.lualine")

-- Explorer
require("plugins.explorer.oil")

-- Terminal
require("plugins.terminal.floaterm")

-- Util
require("plugins.util.navigator")
require("plugins.util.which-key")
