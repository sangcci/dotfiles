vim.pack.add({
	{ src = "https://github.com/JavaHello/spring-boot.nvim", version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/nvim-java/nvim-java" },
})

-- NOTE: Manual fix applied to nvim-java plugin:
-- ~/.local/share/nvim/site/pack/core/opt/nvim-java/lua/java-refactor/client-command-handlers.lua:21
-- `action.rename(params)` → `action:rename(params)`
-- Using `.` passes `params` as `self`, making the actual param nil → ipairs(nil) error on extract variable.
-- Reapply after plugin updates.

-- NOTE: before use it, ensure installed `wget` in local
require("java").setup()
vim.lsp.config("jdtls", {
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>ci", function()
			java_action("source.organizeImports")()
		end, { buffer = bufnr, silent = true, desc = "Organize imports" })
		vim.keymap.set("v", "<leader>cr", function()
			java_action("refactor.extract.variable")()
		end, { buffer = bufnr, silent = true, desc = "Extract variable" })
		vim.keymap.set("v", "<leader>cm", function()
			java_action("refactor.extract.method")()
		end, { buffer = bufnr, silent = true, desc = "Extract method" })
		-- Use conform for formatting instead of jdtls
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = vim.fn.expand("~/.sdkman/candidates/java/17.0.17-tem"),
					},
					{
						name = "JavaSE-21",
						path = vim.fn.expand("~/.sdkman/candidates/java/21.0.9-tem"),
					},
					{
						name = "JavaSE-25",
						path = vim.fn.expand("~/.sdkman/candidates/java/25.0.1-tem"),
					},
				},
			},
		},
	},
})
vim.lsp.enable("jdtls")
