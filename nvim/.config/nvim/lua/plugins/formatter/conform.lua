vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		java = { "spotless" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
	},
	formatters = {
		spotless = {
			command = "sh",
			args = {
				"-c",
				"cd " .. vim.fn.getcwd() .. " && ./gradlew spotlessApply",
			},
			stdin = false,
			exit_codes = { 0, 1 },
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
	callback = function(args)
		require("conform").format({ bufnr = args.buf, async = false }, function(err)
			if err then
				vim.notify(
					"Format failed: " .. tostring(err),
					vim.log.levels.ERROR
				)
			else
				local formatters = require("conform").list_formatters(args.buf)
				if #formatters > 0 then
					vim.notify(
						"Formatted with: " .. table.concat(formatters, ", "),
						vim.log.levels.INFO
					)
				end
			end
		end)
	end,
})
