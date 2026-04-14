vim.pack.add({
	{ src = "https://github.com/mrjones2014/smart-splits.nvim" },
})

require("smart-splits").setup({})

vim.keymap.set({ "n", "t" }, "<A-h>", require("smart-splits").move_cursor_left)
vim.keymap.set({ "n", "t" }, "<A-j>", require("smart-splits").move_cursor_down)
vim.keymap.set({ "n", "t" }, "<A-k>", require("smart-splits").move_cursor_up)
vim.keymap.set({ "n", "t" }, "<A-l>", require("smart-splits").move_cursor_right)

