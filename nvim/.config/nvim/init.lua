-- NOTE: vim.pack package manager path recognition issue
-- if nvim was installed by another way such as `bob`, we have to set the right path so that they can recognize.
-- issue: https://github.com/neovim/neovim/issues/36529
-- doc: https://github.com/neovim/neovim/blob/8bce9342d101eed4bb16fe03d36e7f89bac991ab/runtime/doc/pack.txt#L214-L216
vim.o.packpath = vim.fn.stdpath("config") .. "," .. vim.o.packpath .. "," .. vim.fn.expand("~/.local/share/nvim/site")

if vim.g.vscode then
	-- VS Code specific config
	require("vsc_config.options")
	require("vsc_config.keymaps")

	-- Essential plugins for VS Code
	require("plugins.editor.surround")
	require("plugins.syntaxtree.treesitter")
else
	-- Native Neovim config
	require("config.colorscheme")
	require("config.options")
	require("config.keymaps")

	-- vim.pack
	require("pack.pack-manager")

	-- Plugins (Loaded in both but categorized here for clarity)
	require("plugins.editor.surround")
	require("plugins.util.harpoon2")
	require("plugins.syntaxtree.treesitter")

	-- decorator
	require("plugins.decorator.alpha-nvim")
	require("plugins.decorator.lualine")

	-- fuzzy finder
	require("plugins.fuzzyfinder.telescope")

	-- auto completion
	require("plugins.autocompletion.blink-cmp")

	-- formatter
	require("plugins.formatter.conform")

	-- explorer
	require("plugins.explorer.oil")

	-- editor
	require("plugins.editor.autopair")
	require("plugins.editor.comment")
	require("plugins.editor.indent-blankline")
	require("plugins.editor.todo-comments")
	require("plugins.editor.undotree")

	-- git
	require("plugins.git.diffview")

	-- util
	require("plugins.util.fidget")
	require("plugins.util.live-preview")
	require("plugins.util.markview")
	require("plugins.util.navigator")
	require("plugins.util.render-markdown")
	require("plugins.util.which-key")

	-- ai
	require("ai.copilot")

	-- db
	require("db.nvim-dbee")

	-- lsp
	require("lsp.lsp-configs")
	require("lsp.nvim-dap")
	-- require("lsp.nvim-jdtls")
	require("lsp.nvim-java")
	-- require("lsp.nvim-jls")
	require("lsp.nvim-neotest")
end

