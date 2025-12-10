vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		java = { "google-java-format" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
	},
	formatters = {
		-- ensures 4-space indentation for java
		["google-java-format"] = {
			prepend_args = { "--aosp" },
		},
		stylua = {
			prepend_args = {
				"--collapse-simple-statement",
				"FunctionOnly",
				"--column-width",
				"200",
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})
