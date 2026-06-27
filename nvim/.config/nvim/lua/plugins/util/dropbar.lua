vim.pack.add({
	{ src = "https://github.com/Bekaboo/dropbar.nvim" },
})

local excluded_filetypes = {
	["neo-tree"] = true,
	["DiffviewFiles"] = true,
	["DiffviewFileHistory"] = true,
	["DiffviewFileHistoryPanel"] = true,
}

require("dropbar").setup({
	bar = {
		enable = function(buf, win, _)
			if not buf or not win then
				return false
			end
			if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then
				return false
			end
			if excluded_filetypes[vim.bo[buf].filetype] then
				return false
			end
			return vim.bo[buf].buftype == ""
				and vim.api.nvim_buf_get_name(buf) ~= ""
				and not vim.wo[win].diff
		end,
	},
})

local function set_hl_bg(group, bg)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
	if not ok then
		hl = {}
	end
	hl.bg = bg
	vim.api.nvim_set_hl(0, group, hl)
end

local function set_dropbar_bg()
	local ok, normal = pcall(vim.api.nvim_get_hl, 0, { name = "Normal", link = false })
	local bg = ok and normal.bg or "NONE"
	if not bg then
		bg = "NONE"
	end

	set_hl_bg("WinBar", bg)
	set_hl_bg("WinBarNC", bg)

	for group, _ in pairs(vim.api.nvim_get_hl(0, {})) do
		if group:match("^DropBar") then
			set_hl_bg(group, bg)
		end
	end
end

set_dropbar_bg()
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_dropbar_bg,
})

local dropbar_api = require("dropbar.api")
vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
