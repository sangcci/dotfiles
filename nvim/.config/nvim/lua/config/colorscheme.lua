vim.pack.add({
	{ src = "https://github.com/webhooked/kanso.nvim" },
	{ src = "https://github.com/rktjmp/lush.nvim" },
	{ src = "https://github.com/zenbones-theme/zenbones.nvim" },
	{ src = "https://github.com/darkvoid-theme/darkvoid.nvim" },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

-- kanso
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
})

-- darkvoid
require("darkvoid").setup({})

-- zenbones
vim.g.zenbones_variant = "dark"
vim.g.kanagawabones_italic = 1
vim.g.kanagawabones_bold = 1

vim.opt.fillchars = { eob = " " }

-- catppuccin
require("catppuccin").setup({
	transparent_background = true,
	float = {
		transparent = true,
	},
})

-- setup colorscheme
vim.cmd.colorscheme("catppuccin-mocha")

-- Custom Colorscheme Setup
local function hl_color(group, attr)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
	if ok and hl[attr] then
		return string.format("#%06x", hl[attr])
	end
	return "NONE"
end

local bg_normal = hl_color("Normal", "bg")
local bg_float = hl_color("NormalFloat", "bg")
local bg_cursorline = hl_color("CursorLine", "bg")
local fg_normal = hl_color("Normal", "fg")
local fg_dim = hl_color("Comment", "fg")
local accent = hl_color("Special", "fg")

-- Telescope
-- vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = accent, bold = true })
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bg_cursorline })
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = bg_cursorline, bg = bg_cursorline })
-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = fg_dim, bg = bg_float })
-- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = bg_float, bg = bg_float })
-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg_normal })
-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = bg_normal, bg = bg_normal })

-- Float / NormalFloat
vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_float })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = bg_float, bg = bg_float })
vim.api.nvim_set_hl(0, "FloatTitle", { fg = accent, bold = true })

-- Pmenu
vim.api.nvim_set_hl(0, "Pmenu", { bg = bg_float })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = bg_cursorline })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = bg_normal })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = fg_dim })

-- DiagnosticVirtualText
local diag_e = hl_color("DiagnosticError", "fg")
local diag_w = hl_color("DiagnosticWarn", "fg")
local diag_i = hl_color("DiagnosticInfo", "fg")
local diag_h = hl_color("DiagnosticHint", "fg")
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = diag_e, bg = bg_float })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = diag_w, bg = bg_float })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = diag_i, bg = bg_float })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = diag_h, bg = bg_float })

-- RenderMarkdown
local c_h1 = hl_color("Special", "fg")
local c_h2 = hl_color("Function", "fg")
local c_h3 = hl_color("String", "fg")
local c_h4 = hl_color("Keyword", "fg")
local c_h5 = hl_color("Type", "fg")
local c_h6 = hl_color("Number", "fg")
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = c_h1, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = c_h2, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = c_h3, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = c_h4, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = c_h5, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = c_h6, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = bg_float })
vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = bg_float, fg = c_h3 })
vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = c_h2 })
vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = fg_dim, italic = true })
vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = c_h3, underline = true })
vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = fg_dim })

-- Tabline
vim.api.nvim_set_hl(0, "TabLine", { fg = fg_normal, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = fg_normal, bg = "NONE", bold = true })

-- WhichKey
-- local which_key_bg = bg_cursorline ~= "NONE" and bg_cursorline or bg_float
-- if which_key_bg == "NONE" then
-- 	which_key_bg = "#1e1e2e"
-- end
--
-- local function set_hl_bg(group, bg)
-- 	local fg = hl_color(group, "fg")
-- 	local hl = { bg = bg }
-- 	if fg ~= "NONE" then
-- 		hl.fg = fg
-- 	end
-- 	vim.api.nvim_set_hl(0, group, hl)
-- end
--
-- vim.api.nvim_set_hl(0, "WhichKeyNormal", { fg = fg_normal, bg = which_key_bg })
-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = which_key_bg, bg = which_key_bg })
--
-- for _, group in ipairs({
-- 	"WhichKey",
-- 	"WhichKeyDesc",
-- 	"WhichKeyGroup",
-- 	"WhichKeyIcon",
-- 	"WhichKeyIconAzure",
-- 	"WhichKeyIconBlue",
-- 	"WhichKeyIconCyan",
-- 	"WhichKeyIconGreen",
-- 	"WhichKeyIconGrey",
-- 	"WhichKeyIconOrange",
-- 	"WhichKeyIconPurple",
-- 	"WhichKeyIconRed",
-- 	"WhichKeyIconYellow",
-- 	"WhichKeySeparator",
-- 	"WhichKeyTitle",
-- 	"WhichKeyValue",
-- }) do
-- 	set_hl_bg(group, which_key_bg)
-- end
