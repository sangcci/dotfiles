vim.pack.add({
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local actions = require("diffview.actions")
require("diffview").setup({
	keymaps = {
		view = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
		file_panel = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
		file_history_panel = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
	},
})

vim.keymap.set("n", "<leader>gg", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Open file history" })
vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "Open current file history" })

vim.cmd([[cnoreabbrev <expr> q getcmdtype() ==# ':' && getcmdline() ==# 'q' && luaeval("require('plugins.git.gitsigns').has_diff_window()") ? 'GitsignsDiffClose' : (getcmdtype() ==# ':' && getcmdline() ==# 'q' && luaeval("require('diffview.lib').get_current_view() ~= nil") ? 'DiffviewClose' : 'q')]])
