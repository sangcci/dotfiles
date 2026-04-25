vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
	open_mapping = "<leader>T",
	direction = "vertical",
	size = 40,
})

-- Terminal mode escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
