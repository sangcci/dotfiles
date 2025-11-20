vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.1.9" }, -- v0.1.9 (latest) commit hash
})

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = { -- Note: 'defaults' was missing in your original config
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
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

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]inder [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files ('.' for repeat)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind Existing [B]uffers" })
