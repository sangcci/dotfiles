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
		-- These three settings are optional, but recommended.
		prompt_prefix = "",
		entry_prefix = " ",
		selection_caret = " ",
		path_display = {
			"filename_first", -- Truncate from the start
			-- truncate = 3, -- Show at least 3 chars of each directory
		},
		layout_strategy = "grey", -- grey, horizontal
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
		},
		sorting_strategy = "ascending",
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
			require("telescope.themes").get_dropdown(),
		},
	},
})
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("grey")
