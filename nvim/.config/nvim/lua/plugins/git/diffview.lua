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

vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Diffview Close" })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "Diffview File History" })
vim.keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", { desc = "Diffview File History %" })
