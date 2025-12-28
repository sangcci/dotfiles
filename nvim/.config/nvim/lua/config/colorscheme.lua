vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/yorickpeterse/nvim-grey" },
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/rose-pine/neovim" },
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

require("kanagawa").setup({
	theme = "dragon",
	background = { dark = "dragon" },
	overrides = function(colors)
		local theme = colors.theme
		return {
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency,,
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = "#C0A36E" },
			BlinkCmpMenuBorder = { fg = "", bg = "" },

			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },
			-- LineNr = { fg = "#C0A36E", bg = "NONE" },
			CursorLineNr = { fg = colors.palette.sakuraPink, bg = "NONE" },
		}
	end,
})

vim.cmd.colorscheme("kanagawa-dragon")

-- indent highlight group define as github_dark doesn't have highlight group
-- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#21262d", nocombine = true })
-- vim.api.nvim_set_hl(0, "IblScope", { fg = "#1f6feb", nocombine = true })
-- vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#21262d", nocombine = true })

-- Set transparency AFTER loading colorscheme
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
