vim.pack.add({
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/fredrikaverpil/neotest-golang" },
	{ src = "https://github.com/nvim-neotest/neotest-python" },
	{ src = "https://github.com/rcasia/neotest-java" },
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
		require("neotest-java"),
	},
	log_level = vim.log.levels.DEBUG,
})

vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Test Attach" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test Run File" })
vim.keymap.set("n", "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end, { desc = "Test All Files" })
vim.keymap.set("n", "<leader>tS", function() require("neotest").run.run({ suite = true }) end, { desc = "Test Suite" })
vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Test Nearest" })
vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Test Last" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Test Summary" })
vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = "Test Output" })
vim.keymap.set("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Test Output Panel" })
vim.keymap.set("n", "<leader>tt", function() require("neotest").run.stop() end, { desc = "Test Terminate" })
vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ suite = false, strategy = "dap" }) end, { desc = "Debug Nearest Test" })
vim.keymap.set("n", "<leader>tD", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, { desc = "Debug Current File" })
