vim.pack.add({
	{ src = "https://github.com/Cannon07/claude-preview.nvim" },
})

require("claude-preview").setup({
	neo_tree = {
		position = "left",
	},
})
