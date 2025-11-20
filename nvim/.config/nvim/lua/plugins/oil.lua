vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/benomahony/oil-git.nvim" },
	{ src = "https://github.com/refractalize/oil-git-status.nvim" },
})

require("oil").setup({
	default_file_explorer = true,
	win_options = {
		signcolumn = "yes:2",
	},
	view_options = {
		show_hidden = true,
	},
})
require("oil-git-status").setup({})

-- if we go back to parent directory, just <leader>e one more time
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "[E]xplorer Oil" })
