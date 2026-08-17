vim.pack.add({
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		follow_current_file = { enabled = true },
		group_empty_dirs = true,
		window = {
			mappings = {
				["-"] = "close_window",
			},
		},
	},
})

vim.keymap.set("n", "-", "<CMD>Neotree filesystem reveal_force_cwd<CR>", { desc = "Focus file explorer" })

local neo_tree_quit_group = vim.api.nvim_create_augroup("CloseNeoTreeWithCodeWindow", { clear = true })
vim.api.nvim_create_autocmd("QuitPre", {
	group = neo_tree_quit_group,
	callback = function()
		if vim.bo.filetype == "neo-tree" or vim.bo.buftype ~= "" then
			return
		end
		vim.cmd("silent! Neotree close filesystem")
	end,
})
