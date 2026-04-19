vim.pack.add({
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("yazi").setup({
	open_for_directories = true,
	open_multiple_tabs = true,
})

vim.keymap.set("n", "<leader>e", "<cmd>Yazi<cr>", { desc = "Open yazi" })
vim.keymap.set("n", "<leader>E", "<cmd>Yazi cwd<cr>", { desc = "Open yazi at cwd" })
vim.keymap.set("n", "<C-up>", "<cmd>Yazi toggle<cr>", { desc = "Resume last yazi session" })
