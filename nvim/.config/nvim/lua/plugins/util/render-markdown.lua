vim.pack.add({
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-mini/mini.icons",
})

require("render-markdown").setup({
	render_modes = { "n", "no", "i", "v", "V", "^V", "r", "x", "c" },
	file_types = { "markdown", "quarto", "rmd", "Avante", "noice" },
	restart_highlighter = true,
	completions = {
		lsp = {
			enabled = true,
		},
		blink = {
			enabled = true,
		},
	},
	heading = {
		border = true,
		border_virtual = true,
		icons = { "󰉫   ", "󰉬   ", "󰉭   ", "󰉮   ", "󰉯   ", "󰉰   " },
		width = "block",
		left_pad = 2,
		right_pad = 4,
		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},
		foregrounds = {
			"RenderMarkdownH1",
			"RenderMarkdownH2",
			"RenderMarkdownH3",
			"RenderMarkdownH4",
			"RenderMarkdownH5",
			"RenderMarkdownH6",
		},
	},
	indent = {
		enabled = true,
		skip_heading = true,
	},
	code = {
		position = "right",
		border = "thick",
		width = "block",
		left_pad = 2,
		right_pad = 2,
	},
	bullet = {
		icons = { "", "" },
	},
})
