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
		{ "<leader>c", group = "[C]ode" },
		{ "<leader>d", group = "[D]ebug" },
		{ "<leader>e", group = "[E]xplorer" },
		{ "<leader>f", group = "[F]ind" },
		{ "<leader>g", group = "[G]it" },
		{ "<leader>h", group = "[H]arpoon" },
		{ "<leader>j", group = "[J]ava" },
		{ "<leader>t", group = "[T]reesitter" },
		{ "<leader>w", group = "[W]indow" },
		{ "<C-w>", group = "[W]indow for Tmux" },
	},
})
