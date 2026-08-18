vim.pack.add({
	{ src = "https://github.com/NeogitOrg/neogit" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/m00qek/baleia.nvim" },
})

require("neogit").setup({
	integrations = {
		diffview = true,
		telescope = true,
	},
	diff_viewer = "diffview",
	treesitter_diff_highlight = true,
	word_diff_highlight = true,
	graph_style = "kitty",
	auto_show_console_on = "error",
	status = {
		recent_commit_count = 15,
		HEAD_folded = true,
	},
	commit_editor = {
		kind = "tab",
		show_staged_diff = true,
		staged_diff_split_kind = "vsplit",
		spell_check = true,
	},
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
