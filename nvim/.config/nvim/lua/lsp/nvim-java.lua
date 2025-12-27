vim.pack.add({
	{
		src = "https://github.com/JavaHello/spring-boot.nvim",
		version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
	},
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-java/nvim-java",
})

local function java_action(action)
	return function()
		vim.lsp.buf.code_action({
			context = { only = { action } },
			apply = true,
		})
	end
end

-- NOTE: before use it, ensure installed `wget` in local
require("java").setup()
vim.lsp.config("jdtls", {
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>ci", java_action("source.organizeImports"), { buffer = bufnr, silent = true, desc = "Organize imports" })
		vim.keymap.set("n", "<leader>cr", java_action("refactor.extract.variable"), { buffer = bufnr, silent = true, desc = "Extract variable" })
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
