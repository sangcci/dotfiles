-- NOTE: if you want to use on Debian ver +12, we have to create a symlink. Unless not using fd, nothing to do.
-- `sudo ln -s -f "$(which fdfind)" /usr/local/bin/fd`
local pack_builder = require("pack.pack-builder")

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
	{ src = "https://github.com/jonarrien/telescope-cmdline.nvim" },
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
		layout_strategy = "horizontal", -- grey, horizontal
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
			find_command = {
				"fd",
				"--type",
				"f",
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
		cmdline = {
			-- Adjust telescope picker size and layout
			picker = {
				layout_config = {
					width = 120,
					height = 25,
				},
			},
			-- Adjust your mappings
			mappings = {
				complete = "<Tab>",
				run_selection = "<C-CR>",
				run_input = "<CR>",
			},
			-- Triggers any shell command using overseer.nvim (`:!`)
			overseer = {
				enabled = true,
			},
		},
	},
})
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("cmdline")

local builtin = require("telescope.builtin")
vim.keymap.set(
	"n",
	"<leader>ff",
	function()
		builtin.find_files({
			find_command = {
				"fd",
				"--type",
				"f",
				"--exclude",
				"node_modules",
				"--exclude",
				".npm",
				"--exclude",
				".git",
				"--exclude",
				"bin/",
				"--exclude",
				"build/",
			},
		})
	end,
	{ desc = "Find Files" }
)
vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Find Files All" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>f.", builtin.lsp_document_symbols, { desc = "Documents Symbols" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Existing Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tegs" })

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope cmdline<cr>", { desc = "Cmdline" })
