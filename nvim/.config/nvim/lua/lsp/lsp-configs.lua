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
	ensure_installed = servers,
})

require("mason-tool-installer").setup({
	eusure_installed = vim.list_extend(vim.deepcopy(servers), formatters),
})

-- Keymaps (only set when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set(
			"n",
			"<leader>ch",
			vim.lsp.buf.hover,
			vim.tbl_extend("force", opts, { desc = "[C]ode [H]over Documentation" })
		)
		vim.keymap.set(
			"n",
			"<leader>cd",
			vim.lsp.buf.definition,
			vim.tbl_extend("force", opts, { desc = "[C]ode Goto [D]efinition" })
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "[C]ode [A]ctions" })
		)
		vim.keymap.set(
			"n",
			"<leader>cr",
			require("telescope.builtin").lsp_references,
			vim.tbl_extend("force", opts, { desc = "[C]ode Goto [R]eferences" })
		)
		vim.keymap.set(
			"n",
			"<leader>ci",
			require("telescope.builtin").lsp_implementations,
			vim.tbl_extend("force", opts, { desc = "[C]ode Goto [I]mplementations" })
		)
		vim.keymap.set(
			"n",
			"<leader>cR",
			vim.lsp.buf.rename,
			vim.tbl_extend("force", opts, { desc = "[C]ode [R]ename" })
		)
		-- using conform plugins
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ bufnr = args.buf, async = true, lsp_fallback = true })
		end, vim.tbl_extend("force", opts, { desc = "[C]ode [F]ormat" }))

		-- Diagnostics
		vim.keymap.set(
			"n",
			"<leader>ce",
			vim.diagnostic.open_float,
			vim.tbl_extend("force", opts, { desc = "Show diagnostics [E]" })
		)
		vim.keymap.set(
			"n",
			"<leader>cq",
			vim.diagnostic.setloclist,
			vim.tbl_extend("force", opts, { desc = "Diagnostics to loclist [Q]" })
		)
	end,
})
