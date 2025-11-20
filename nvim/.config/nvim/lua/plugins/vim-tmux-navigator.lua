vim.pack.add({
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
})

vim.g.tmux_navigator_no_mappings = 1 -- Example: disable default mappings

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

