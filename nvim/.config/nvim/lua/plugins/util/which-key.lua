vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	preset = "helix",

	-- Group names
	spec = {
		{ "<leader>c", group = "Code" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>e", group = "Explorer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>j", group = "Java" },
		{ "<leader>t", group = "Treesitter" },
		{ "<leader>w", group = "Window" },
		{ "<leader>z", group = "Zettelkasten" },
	},
})
