vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

local servers = {
	"bashls", -- bash
	"lua_ls", -- lua
	"stylua", -- lua formatter
	"html", -- html
	"cssls", -- css
	"jsonls", -- json
	"marksman", -- markdown
	"yamlls", -- yaml
	"lemminx", -- xml
	"gradle_ls", -- gradle
	"groovyls", -- groovy
	"ts_ls", -- typescript/javascript
	"pyright", -- python
	"gopls", -- golang
}

local formatters = {
	"prettier", -- javascript/typescript formatter
	"prettierd", -- javascript/typescript formatter
	"ruff", -- python linter/formatter
}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- NOTE: lsp automatic_enable issue
-- after v2, if we want to override lsp configure, just put in `lua/` directory. mason-lspconfig automatically override.
-- https://github.com/mason-org/mason-lspconfig.nvim/issues/534
require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = {
			"jdtls",
		},
	},
	ensure_installed = servers,
})

require("mason-tool-installer").setup({
	ensure_installed = vim.list_extend(vim.deepcopy(servers), formatters),
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "gl", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Find Definitions" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Find References" })
		vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Find Implementations" })
		vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Find Type Definitions" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
		vim.keymap.set("n", "<leader>r", function()
			local formatter_list = require("conform").list_formatters(args.buf)
			if #formatter_list == 0 then
				vim.notify("No formatters available", vim.log.levels.WARN)
				return
			end
			require("conform").format({ bufnr = args.buf, async = false }, function(err)
				if err then
					vim.notify("Format failed: " .. tostring(err), vim.log.levels.ERROR)
				else
					local names = vim.tbl_map(function(f) return f.name end, formatter_list)
					vim.notify("Formatted with: " .. table.concat(names, ", "), vim.log.levels.INFO)
				end
			end)
		end, vim.tbl_extend("force", opts, { desc = "format" }))
	end,
})
