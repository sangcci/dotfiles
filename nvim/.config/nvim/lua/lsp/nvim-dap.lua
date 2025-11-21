vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
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

-- dap-ui settings
local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup({
	commented = true, -- Show virtual text alongside comment
})
require("dap-python").setup("uv")

-- setup an event listener for when the debugger is launched
-- when the debugger is launched open up the debug ui
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

-- Automatically open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

-- keymaps
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug Step [O]ver" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug Step [I]nto" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "[D]ebug Step [O(c)]out" })
vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebug [C]lose" })
