-- numbering
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4

-- wrap line
vim.opt.wrap = true

-- swap file
vim.opt.swapfile = false -- that is really annoying

-- searching
vim.opt.ignorecase = true -- "hello", "Hello" both can be found.
vim.opt.smartcase = true -- we might need to find only "Hello"
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- window
vim.opt.splitright = true -- not left
vim.opt.splitbelow = true -- not above
vim.opt.laststatus = 3 -- -- global statusline (one statusline for all windows)

-- visible
vim.opt.scrolloff = 10
vim.opt.showmode = false -- hide mode display
vim.opt.cursorline = false

-- undo
vim.opt.undofile = true

-- backup
vim.opt.backup = false

-- copy
vim.opt.clipboard = "unnamedplus" -- enable system clipboard access

-- indent (that's when we're editing.)
-- when we want to apply the formatting on each lauguage, use formatter plugin.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- remove auto-continuation of comment lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function() vim.opt_local.formatoptions:remove({ "c", "r", "o" }) end,
})

-- diagnostic
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

-- diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- tabline
vim.o.showtabline = 2

function _G.custom_tabline()
	local bufname = vim.fn.expand("%:~:.")
	if bufname == "" then
		bufname = "[No Name]"
	end
	return "%=" .. bufname .. "%=" -- centered
end

vim.o.tabline = "%!v:lua.custom_tabline()"
