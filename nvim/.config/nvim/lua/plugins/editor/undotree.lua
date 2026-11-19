vim.pack.add({
	{ src = "https://github.com/mbbill/undotree" },
})

vim.g.undotree_WindowLayout = 3 -- tree on the right, diff below it

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
