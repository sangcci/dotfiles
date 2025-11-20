vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
})

require("mason-nvim-dap").setup({
	ensure_installed = {
		"java-debug-adapter",
		"java-test",
		"debugpy",
	},
})
-- dap-ui settings
local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- setup an event listener for when the debugger is launched
-- when the debugger is launched open up the debug ui
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

-- keymaps
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })
vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebug [C]lose" })
