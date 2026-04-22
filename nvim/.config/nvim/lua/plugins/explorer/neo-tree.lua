vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
	source_selector = {
		winbar = true,
		show_scrolled_off_parent_node = false,
		sources = {
			{ source = "filesystem", display_name = "Exploror" },
			{ source = "buffers", display_name = "Bufs" },
			{ source = "git_status", display_name = "Git" },
		},
		content_layout = "center",
		tabs_layout = "equal",
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { desc = "Open NeoTree" })
