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
	"jdtls", -- java
	"gradle_ls", -- gradle
	"groovyls", -- groovy
	"quick_lint_js", -- javascript/typescript
	"pyright", -- python
	"gopls", -- golang
}

local formatters = {
	"google-java-format", -- java formatter
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
	eusure_installed = vim.list_extend(vim.deepcopy(servers), formatters),
})
