vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

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
-- If we have to set up extra, not just loading automatically by mason-lspconfig, add the exclustions table and set vim.lsp.config() by hands.
-- https://github.com/mason-org/mason-lspconfig.nvim/issues/549
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"jdtls",
	},
	automatic_enable = true,
	automatic_enable_exclusions = {
		"lua_ls",
		"jdtls",
	},
})

require("mason-tool-installer").setup({
	eusure_installed = {
		"lua_ls",
		"jdtls",
	},
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
