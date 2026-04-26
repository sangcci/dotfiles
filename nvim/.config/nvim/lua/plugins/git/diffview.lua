vim.pack.add({
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local actions = require("diffview.actions")
require("diffview").setup({
	keymaps = {
		view = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
		file_panel = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
		file_history_panel = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
	},
})

local function diffview_is_open()
	local ok, lib = pcall(require, "diffview.lib")
	return ok and lib.get_current_view() ~= nil
end

vim.keymap.set("n", "<leader>go", function()
	if diffview_is_open() then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen")
	end
end, { desc = "Diffview Toggle" })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Diffview Close" })

vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		if diffview_is_open() then
			vim.cmd([[cnoreabbrev <expr> <buffer> q (getcmdtype() == ':' && getcmdline() ==# 'q') ? 'DiffviewClose' : 'q']])
		end
	end,
})
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "Diffview File History" })
vim.keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", { desc = "Diffview File History %" })
