vim.pack.add({
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

require("todo-comments").setup({})

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
vim.keymap.set("n", "]e", function()
	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
end, { desc = "Next error/warning todo" })
vim.keymap.set("n", "[e", function()
	require("todo-comments").jump_prev({ keywords = { "ERROR", "WARNING" } })
end, { desc = "Previous error/warning todo" })
