vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/yorickpeterse/nvim-grey" },
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/webhooked/kanso.nvim" },
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
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	theme = "dragon",
	background = { dark = "dragon" },
	overrides = function(colors)
		local theme = colors.theme
		local makeDiagnosticColor = function(color)
			local c = require("kanagawa.lib.color")
			return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
		end
		return {
			-- Save an hlgroup with dark background and dimmed foreground
			-- so that you can use it where your still want darker windows.
			-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

			-- Popular plugins that open floats will link to NormalFloat by default;
			-- set their background accordingly if you wish to keep them dark and borderless
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency,,
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = "#C0A36E" },
			BlinkCmpMenuBorder = { fg = "", bg = "" },

			NormalFloat = { bg = theme.ui.bg_m1 },
			FloatBorder = { bg = theme.ui.bg_m1, fg = theme.ui.bg_m1 },
			FloatTitle = { fg = theme.ui.special, bold = true },
			-- LineNr = { fg = "#C0A36E", bg = "NONE" },
			CursorLineNr = { fg = colors.palette.sakuraPink, bg = "NONE" },

			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

			DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
			DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
			DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
			DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
		}
	end,
})

require("kanso").setup({
	bold = true,
	italics = true,
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	background = {
		dark = "zen", -- zen, ink, or mist
		light = "pearl",
	},
	overrides = function(colors)
		local theme = colors.theme
		local palette = colors.palette
		local makeDiagnosticColor = function(color)
			local c = require("kanso.lib.color")
			return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
		end
		return {
			-- Dark background variants for special windows
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

			-- Plugin windows with dark background
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

			-- Popup menu
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = palette.sumiInk4 or theme.ui.bg_p2 },
			BlinkCmpMenuBorder = { fg = "", bg = "" },

			-- Float windows
			NormalFloat = { bg = theme.ui.bg_m1 },
			FloatBorder = { bg = theme.ui.bg_m1, fg = theme.ui.bg_m1 },
			FloatTitle = { fg = theme.ui.special, bold = true },

			-- Line numbers
			CursorLineNr = { fg = palette.sakuraPink or theme.syn.special1, bg = "NONE" },

			-- Telescope
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

			-- Diagnostic virtual text
			DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
			DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
			DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
			DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
		}
	end,
})

vim.cmd.colorscheme("kanso-zen")

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
