vim.pack.add({
	{ src = "https://github.com/sphamba/smear-cursor.nvim" },
})

require("smear_cursor").setup({
	smear_between_neighbor_lines = true,
})
