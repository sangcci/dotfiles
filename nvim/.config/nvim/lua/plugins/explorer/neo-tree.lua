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
	window = {
		position = "left",
		width = 45,
	},
	close_if_last_window = true,
	source_selector = {
		winbar = true,
		show_scrolled_off_parent_node = false,
		sources = {
			{ source = "filesystem", display_name = "Explorer" },
			{ source = "buffers", display_name = "Bufs" },
			{ source = "git_status", display_name = "Git" },
		},
		content_layout = "center",
		tabs_layout = "equal",
	},
	default_component_configs = {
		indent = {
			with_markers = false,
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { desc = "Open NeoTree" })
