vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/kndndrj/nvim-dbee" },
})

require("dbee").install()

require("dbee").setup()
