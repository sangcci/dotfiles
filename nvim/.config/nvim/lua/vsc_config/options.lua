-- timeout
vim.opt.timeoutlen = 200

-- searching
vim.opt.ignorecase = true -- "hello", "Hello" both can be found.
vim.opt.smartcase = true -- we might need to find only "Hello"

-- undo
vim.opt.undofile = true

-- copy
vim.opt.clipboard = "unnamedplus" -- enable system clipboard access

-- indent (that's when we're editing.)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- remove auto-continuation of comment lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function() vim.opt_local.formatoptions:remove({ "c", "r", "o" }) end,
})
