-- numbering
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4

-- wrap line
vim.opt.wrap = false

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
