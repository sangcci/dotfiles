vim.pack.add({
	{ src = "https://github.com/numToStr/Navigator.nvim" },
})

require("Navigator").setup()

vim.keymap.set("n", "<C-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>NavigatorRight<cr>")
