vim.pack.add({
	{ src = "https://github.com/zk-org/zk-nvim" },
})

require("zk").setup({
	picker = "telescope",
})

vim.lsp.config("zk", {
	cmd = { "zk", "lsp" },
	filetypes = { "markdown" },
	root_dir = function(filename)
		return vim.fs.root(filename, { ".zk" })
	end,
})
vim.lsp.enable("zk")
