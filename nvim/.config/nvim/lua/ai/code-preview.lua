vim.pack.add({
	{ src = "https://github.com/Cannon07/code-preview.nvim" },
})

require("code-preview").setup({
	diff = {
		layout = "inline",
	},
})
