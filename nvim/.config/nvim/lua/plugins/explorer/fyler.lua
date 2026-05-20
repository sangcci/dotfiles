vim.pack.add({
	{
		src = "https://github.com/A7Lavinraj/fyler.nvim",
		version = "stable",
	},
	{
		src = "https://github.com/nvim-mini/mini.icons",
	},
})

require("fyler").setup({
	views = {
		finder = {
			indentscope = {
				enabled = false,
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Fyler<cr>", { desc = "Open Fyler View" })
