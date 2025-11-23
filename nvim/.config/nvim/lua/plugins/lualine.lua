vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

-- lualine configuration
require("lualine").setup({
	options = {
		theme = "catppuccin",
		globalstatus = true,
		icons_enabled = true,
		component_separators = "|",
		section_separators = "",
		disable_filetypes = {
			statusline = { "neo-tree" },
			winbar = {},
		},
	},
})
