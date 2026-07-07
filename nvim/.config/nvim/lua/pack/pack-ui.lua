vim.pack.add({
	{ src = "https://github.com/jtprogru/pack-ui.nvim" },
})

require("pack_ui").setup({
	keymaps = {
		prefix = "<leader>p",
		status = "s", -- <leader>ps -> :PackStatus
		update_all = "U", -- <leader>pU -> :PackUpdateAll
	},
})
