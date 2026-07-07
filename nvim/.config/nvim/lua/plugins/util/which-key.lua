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
		{ "<leader>d", group = "Debug" },
		{ "<leader>e", group = "Explorer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>j", group = "Java" },
		{ "<leader>p", group = "Package" },
		{ "<leader>t", group = "Test" },
		{ "<leader>w", group = "Window" },
	},
})
