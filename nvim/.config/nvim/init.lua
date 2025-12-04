-- NOTE: vim.pack package manager path recognition issue
-- if nvim was installed by another way such as `bob`, we have to set the right path so that they can recognize.
-- issue: https://github.com/neovim/neovim/issues/36529
-- doc: https://github.com/neovim/neovim/blob/8bce9342d101eed4bb16fe03d36e7f89bac991ab/runtime/doc/pack.txt#L214-L216
vim.o.packpath = vim.fn.stdpath("config") .. "," .. vim.o.packpath .. "," .. vim.fn.expand("~/.local/share/nvim/site")

-- options
require("config.options")

-- plugins
require("plugins.autopair")
require("plugins.blink")
require("plugins.colorscheme")
require("plugins.comment")
require("plugins.conform")
require("plugins.diffview")
require("plugins.indent-blankline")
require("plugins.live-preview")
require("plugins.lualine")
require("plugins.navigator")
require("plugins.neoscroll")
require("plugins.oil")
require("plugins.pack-manager")
require("plugins.smear-cursor")
require("plugins.surround")
require("plugins.telescope")
require("plugins.todo-comments")
require("plugins.treesitter")
require("plugins.undotree")
require("plugins.which-key")

-- lsp
require("lsp.lsp-configs")
require("lsp.nvim-dap")
require("lsp.nvim-jdtls")
require("lsp.zk-nvim")
require("lsp.go-nvim")

-- keymap
require("config.keymaps")
