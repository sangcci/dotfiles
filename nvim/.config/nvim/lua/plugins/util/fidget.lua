vim.pack.add({
	{ src = "https://github.com/j-hui/fidget.nvim" },
})

require("fidget").setup()

require("telescope").load_extension("fidget")
vim.keymap.set("n", "<leader>fn", function() require("telescope").extensions.fidget.fidget() end, { desc = "Find Notifications" })
