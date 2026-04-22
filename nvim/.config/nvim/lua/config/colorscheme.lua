vim.pack.add({
	{ src = "https://github.com/webhooked/kanso.nvim" },
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
		light = "zen",
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

vim.cmd.colorscheme("kanso")

-- Set transparency AFTER loading colorscheme
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
