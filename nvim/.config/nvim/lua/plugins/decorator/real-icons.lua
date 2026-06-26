vim.pack.add({
	{ src = "https://github.com/Mirsmog/real-icons.nvim" },
})

require("real-icons").setup({
	integrations = {
		oil = true,
		telescope = true,
	},
})
