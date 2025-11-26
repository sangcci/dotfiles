vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/yorickpeterse/nvim-grey" },
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
vim.cmd.colorscheme("grey")

-- Set transparency AFTER loading colorscheme
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
