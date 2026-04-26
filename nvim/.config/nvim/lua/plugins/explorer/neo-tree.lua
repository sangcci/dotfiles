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
		},
		content_layout = "center",
		tabs_layout = "equal",
	},
	default_component_configs = {
		indent = {
			with_markers = false,
		},
		name = {
			use_git_status_colors = false,
		},
		git_status = {
			symbols = {
				added = "",
				modified = "",
				deleted = "",
				renamed = "",
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
		modified = {
			symbol = "",
		},
	},
})

vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd("Neotree close")
	else
		vim.cmd("Neotree reveal")
	end
end, { desc = "Toggle NeoTree (reveal current file)" })
