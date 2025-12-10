vim.pack.add({
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})

-- NOTE: This plugin supports live-previewing Markdown, AsciiDoc and SVG files without the need to save the file.
-- However, for HTML files, the preview will only be updated when you save the file.
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
	pattern = "*",
	callback = function() vim.cmd("silent! write") end,
})
