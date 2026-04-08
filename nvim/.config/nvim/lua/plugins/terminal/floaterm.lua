vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
	open_mapping = "<leader>tt",
	direction = "float",
	float_opts = {
		border = "rounded",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
	},
})

-- Terminal mode escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
