vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/sschleemilch/slimline.nvim" },
})

require("slimline").setup({
	style = "fg",
	spaces = {
		components = "",
		left = "",
		right = "",
	},
	components = {
		left = { "mode", "git" },
		center = {},
		right = { "diagnostics", "filetype_lsp", "progress" },
	},
	disabled_filetypes = { "neo-tree" },
})
