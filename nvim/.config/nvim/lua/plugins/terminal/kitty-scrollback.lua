vim.pack.add({
	{
		src = "https://github.com/mikesmithgh/kitty-scrollback.nvim",
		name = "kitty-scrollback.nvim",
	},
})

require("kitty-scrollback").setup()
