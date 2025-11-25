local pack_builder = require("pack_builder")

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.1.9" }, -- v0.1.9 (latest) commit hash
})
pack_builder.build_plugin("telescope-fzf-native.nvim", "make")

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = { -- Note: 'defaults' was missing in your original config
		path_display = {
			"filename_first", -- Truncate from the start
			-- truncate = 3, -- Show at least 3 chars of each directory
		},
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = {
				"fd",
				"--type",
				"f",
				"--hidden",
				"--exclude",
				".git",
				"--exclude",
				"node_modules",
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- You can customize the appearance
			}),
		},
	},
})
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
