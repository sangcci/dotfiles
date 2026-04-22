vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

-- lualine configuration
require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		icons_enabled = true,
		component_separators = "",
		section_separators = "",
		disable_filetypes = {
			statusline = { "neo-tree" },
			winbar = {},
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str) return str:sub(1, 1) end,
			},
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {}, -- Remove filename from here
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
