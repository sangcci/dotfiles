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
		{ "<leader>D", group = "Sqmeow" },
		{ "<leader>e", group = "Explorer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>j", group = "Java" },
		{ "<leader>m", group = "Markdown" },
		{ "<leader>p", group = "Package" },
		{ "<leader>t", group = "Test" },
		{ "<leader>w", group = "Window" },
	},
})
