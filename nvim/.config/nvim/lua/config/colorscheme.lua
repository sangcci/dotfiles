vim.pack.add({
	{ src = "https://github.com/webhooked/kanso.nvim" },
	{ src = "https://github.com/rktjmp/lush.nvim" },
	{ src = "https://github.com/zenbones-theme/zenbones.nvim" },
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

vim.g.zenbones_variant = "dark"
vim.g.kanagawabones_italic = 1
vim.g.kanagawabones_bold = 1

vim.opt.fillchars = { eob = " " }

vim.cmd.colorscheme("kanagawabones")

-- runtime에서 현재 로드된 colorscheme의 색상 추출
local function hl_color(group, attr)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
	if ok and hl[attr] then
		return string.format("#%06x", hl[attr])
	end
	return "NONE"
end

local bg_normal     = hl_color("Normal",     "bg")
local bg_float      = hl_color("NormalFloat", "bg")
local bg_cursorline = hl_color("CursorLine",  "bg")
local fg_normal     = hl_color("Normal",      "fg")
local fg_dim        = hl_color("Comment",     "fg")
local accent        = hl_color("Special",     "fg")

-- Telescope: border 선 제거, 패널별 배경색으로 구분
vim.api.nvim_set_hl(0, "TelescopeTitle",         { fg = accent, bold = true })
vim.api.nvim_set_hl(0, "TelescopePromptNormal",  { bg = bg_cursorline })
vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { fg = bg_cursorline, bg = bg_cursorline })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = fg_dim, bg = bg_float })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = bg_float, bg = bg_float })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg_normal })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = bg_normal, bg = bg_normal })

-- Float / NormalFloat
vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_float })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = bg_float, bg = bg_float })
vim.api.nvim_set_hl(0, "FloatTitle",  { fg = accent, bold = true })

-- Pmenu
vim.api.nvim_set_hl(0, "Pmenu",      { bg = bg_float })
vim.api.nvim_set_hl(0, "PmenuSel",   { bg = bg_cursorline })
vim.api.nvim_set_hl(0, "PmenuSbar",  { bg = bg_normal })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = fg_dim })

-- DiagnosticVirtualText: 진단 색상 유지, bg는 float로 통일
local diag_e = hl_color("DiagnosticError", "fg")
local diag_w = hl_color("DiagnosticWarn",  "fg")
local diag_i = hl_color("DiagnosticInfo",  "fg")
local diag_h = hl_color("DiagnosticHint",  "fg")
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = diag_e, bg = bg_float })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = diag_w, bg = bg_float })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = diag_i, bg = bg_float })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = diag_h, bg = bg_float })

-- RenderMarkdown: syntax 색상에서 헤딩별 색상 추출
local c_h1 = hl_color("Special",  "fg")
local c_h2 = hl_color("Function", "fg")
local c_h3 = hl_color("String",   "fg")
local c_h4 = hl_color("Keyword",  "fg")
local c_h5 = hl_color("Type",     "fg")
local c_h6 = hl_color("Number",   "fg")
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH1",   { fg = c_h1, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2",   { fg = c_h2, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3",   { fg = c_h3, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH4",   { fg = c_h4, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH5",   { fg = c_h5, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH6",   { fg = c_h6, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownCode",       { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = bg_float, fg = c_h3 })
vim.api.nvim_set_hl(0, "RenderMarkdownBullet",     { fg = c_h2 })
vim.api.nvim_set_hl(0, "RenderMarkdownQuote",      { fg = fg_dim, italic = true })
vim.api.nvim_set_hl(0, "RenderMarkdownLink",       { fg = c_h3, underline = true })
vim.api.nvim_set_hl(0, "RenderMarkdownDash",       { fg = fg_dim })

-- Tabline
vim.api.nvim_set_hl(0, "TabLine",     { fg = fg_normal, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TabLineSel",  { fg = fg_normal, bg = "NONE", bold = true })
