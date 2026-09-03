vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

local M = {}

local function get_diff_win()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
		if vim.wo[win].diff and vim.startswith(bufname, "gitsigns://") then return win end
	end
end

function M.has_diff_window() return get_diff_win() ~= nil end

vim.api.nvim_create_user_command("GitsignsDiffClose", function()
	local win = get_diff_win()
	if win then vim.api.nvim_win_close(win, false) end
end, {})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")
		local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc }) end

		map("<leader>gi", gitsigns.preview_hunk_inline, "Preview hunk inline")
		map("<leader>gp", gitsigns.preview_hunk, "Preview hunk")
		map("<leader>gd", gitsigns.diffthis, "Diff current file")
	end,
})

return M
