vim.pack.add({
	{ src = "https://github.com/barrettruth/canola.nvim" },
})

require("oil").setup({
	default_file_explorer = true,
	columns = {
		--"icon",
		"permission",
		"size",
	},
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
