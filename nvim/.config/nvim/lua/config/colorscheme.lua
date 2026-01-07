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
	transparent = true,
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

			-- Render-markdown highlights
			RenderMarkdownH1Bg = { bg = theme.ui.bg_p1 },
			RenderMarkdownH2Bg = { bg = theme.ui.bg_p1 },
			RenderMarkdownH3Bg = { bg = theme.ui.bg_p1 },
			RenderMarkdownH4Bg = { bg = theme.ui.bg_p1 },
			RenderMarkdownH5Bg = { bg = theme.ui.bg_p1 },
			RenderMarkdownH6Bg = { bg = theme.ui.bg_p1 },
			RenderMarkdownH1 = { fg = palette.sakuraPink or theme.syn.special1, bold = true },
			RenderMarkdownH2 = { fg = palette.oniViolet or theme.syn.identifier, bold = true },
			RenderMarkdownH3 = { fg = palette.crystalBlue or theme.syn.special2, bold = true },
			RenderMarkdownH4 = { fg = palette.springGreen or theme.syn.string, bold = true },
			RenderMarkdownH5 = { fg = palette.carpYellow or theme.syn.operator, bold = true },
			RenderMarkdownH6 = { fg = palette.waveAqua1 or theme.syn.fun, bold = true },
			RenderMarkdownCode = { bg = theme.ui.bg_m1 },
			RenderMarkdownCodeInline = { bg = theme.ui.bg_m1, fg = palette.springGreen or theme.syn.string },
			RenderMarkdownBullet = { fg = palette.oniViolet or theme.syn.identifier },
			RenderMarkdownQuote = { fg = theme.ui.fg_dim, italic = true },
			RenderMarkdownLink = { fg = palette.crystalBlue or theme.syn.special2, underline = true },
			RenderMarkdownDash = { fg = theme.ui.fg_dim },

			-- Tabline highlights (transparent)
			TabLine = { fg = theme.ui.fg, bg = "NONE", bold = true },
			TabLineFill = { bg = "NONE" },
			TabLineSel = { fg = theme.ui.fg, bg = "NONE", bold = true },
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
