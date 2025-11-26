vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/benomahony/oil-git.nvim" },
})

require("oil").setup({
	default_file_explorer = true,
	win_options = {
		signcolumn = "yes:2",
	},
	view_options = {
		show_hidden = true,
	},
})
require("oil-git").setup({
	symbols = {
		added = " + ",
		modified = " ~ ",
		deleted = " - ",
		renamed = " → ",
		untracked = " ? ",
		ignored = " · ",
	},

	highlights = {
		OilGitAdded = { bg = "#005f00", fg = "#ffffff", bold = true }, -- Green bg, white text
		OilGitModified = { bg = "#005f87", fg = "#ffffff", bold = true }, -- Blue bg, white text
		OilGitDeleted = { bg = "#af0000", fg = "#ffffff", bold = true }, -- Red bg, white text
		OilGitRenamed = { bg = "#5f5faf", fg = "#ffffff", bold = true }, -- Purple bg, white text
		OilGitUntracked = { bg = "#808080", fg = "#ffffff" }, -- Gray bg, white text
		OilGitIgnored = { bg = "#a8a8a8", fg = "#ffffff" }, -- Light gray bg, white text
	},
})
