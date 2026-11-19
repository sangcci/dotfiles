vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
	preset = "helix",

	-- Window design
	win = {
		border = "none",
	},

	-- Group names
	spec = {
		{ "<leader>c", group = "Code" },
		{ "<leader>e", group = "Explorer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>j", group = "Java" },
		{ "<leader>m", group = "Markdown" },
		{ "<leader>p", group = "Package" },
		{ "<leader>w", group = "Window" },
	},
})
