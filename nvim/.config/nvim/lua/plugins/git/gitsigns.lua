vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({
	word_diff = true,
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")
		local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc }) end

		map("<leader>gi", gitsigns.preview_hunk_inline, "Preview hunk inline")
		map("<leader>gp", gitsigns.preview_hunk, "Preview hunk")
		map("<leader>gd", gitsigns.diffthis, "Diff current file")
	end,
})
