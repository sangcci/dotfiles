vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/RRethy/base16-nvim" },
})

require("catppuccin").setup({
	flavour = "macchiato", -- auto, latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	float = {
		transparent = true, -- enable transparent floating windows
	},
})

require("base16-colorscheme").with_config({
	telescope = true,
	indentblankline = true,
	-- notify = true,
	-- ts_rainbow = true,
	-- cmp = true,
	-- illuminate = true,
	dapui = true,
})
vim.cmd.colorscheme("base16-black-metal-khold")
