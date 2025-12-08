vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/igorlfs/nvim-dap-view" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
})

local debug_adapters = {
	"java-debug-adapter",
	"java-test",
	"debugpy",
}

require("mason-nvim-dap").setup({
	ensure_installed = debug_adapters,
})

require("nvim-dap-virtual-text").setup({
	commented = true, -- Show virtual text alongside comment
})

require("dap-python").setup("uv")

-- Debug
vim.keymap.set("n", "<leader>ds", "<cmd>DapViewOpen<cr>", { desc = "Start" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapViewClose<cr>", { desc = "Close" })
