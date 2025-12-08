vim.pack.add({
	{ src = "https://github.com/numToStr/Navigator.nvim" },
})

require("Navigator").setup()

vim.keymap.set({ "n", "t" }, "<M-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set({ "n", "t" }, "<M-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set({ "n", "t" }, "<M-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set({ "n", "t" }, "<M-l>", "<cmd>NavigatorRight<cr>")
