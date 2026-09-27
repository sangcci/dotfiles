vim.pack.add({
	{ src = "https://github.com/2giosangmitom/sqmeow.nvim", version = vim.version.range("*") },
})

require("sqmeow").setup()

vim.keymap.set("n", "<leader>Dd", "<cmd>Sqmeow toggle<cr>", { desc = "Toggle database drawer" })
vim.keymap.set("n", "<leader>Dc", "<cmd>Sqmeow cancel<cr>", { desc = "Cancel database query" })
vim.keymap.set("n", "<leader>Da", "<cmd>Sqmeow add<cr>", { desc = "Add database connection" })
vim.keymap.set("n", "<leader>Ds", "<cmd>Sqmeow scratch<cr>", { desc = "New database scratchpad" })
