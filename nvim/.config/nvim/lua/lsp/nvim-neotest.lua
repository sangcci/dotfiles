vim.pack.add({
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/fredrikaverpil/neotest-golang" },
	{ src = "https://github.com/nvim-neotest/neotest-python" },
})

-- TODO: to fix the neotest-golang setup for attach to go
require("neotest").setup({
	adapters = {
		require("neotest-golang")({
			runner = "gotestsum",
			filter_dirs = {
				".git",
				"node_modules",
				".venv",
				"venv",
				"go.mod",
			},
		}),
		require("neotest-python"),
		-- NOTE: don't use the neotest-java. it's config makes me so confuse. instead using nvim-java built in test api and using cli.
	},
	log_level = vim.log.levels.DEBUG,
})

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = { "go", "python", "rust", "javascript", "typescript", "lua" }, -- Add your languages
	callback = function()
		vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "[t]est [a]ttach" })
		vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "[t]est run [f]ile" })
		vim.keymap.set("n", "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end, { desc = "[t]est [A]ll files" })
		vim.keymap.set("n", "<leader>tS", function() require("neotest").run.run({ suite = true }) end, { desc = "[t]est [S]uite" })
		vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "[t]est [n]earest" })
		vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "[t]est [l]ast" })
		vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "[t]est [s]ummary" })
		vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = "[t]est [o]utput" })
		vim.keymap.set("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "[t]est [O]utput panel" })
		vim.keymap.set("n", "<leader>tt", function() require("neotest").run.stop() end, { desc = "[t]est [t]erminate" })
		vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ suite = false, strategy = "dap" }) end, { desc = "Debug nearest test" })
		vim.keymap.set("n", "<leader>tD", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, { desc = "Debug current file" })
	end,
})
