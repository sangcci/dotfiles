vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

require("ibl").setup({
	indent = {
		highlight = { "IblIndent" },
		char = "│",
	},
	scope = {
		enabled = true,
		highlight = { "IblScope" },
	},
})
