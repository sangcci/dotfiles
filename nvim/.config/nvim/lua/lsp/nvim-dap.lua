vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	{ src = "https://github.com/igorlfs/nvim-dap-view" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },
})

local debug_adapters = {
	"debugpy",
	"delve",
}

require("mason-nvim-dap").setup({
	ensure_installed = debug_adapters,
})

require("nvim-dap-virtual-text").setup({
	commented = true, -- Show virtual text alongside comment
})

require("dap-view").setup({
	winbar = {
		show = true,
		sections = {
			"scopes",
			"watches",
			"exceptions",
			"breakpoints",
			"threads",
			"repl",
			"console",
		},
		default_section = "scopes",
		controls = {
			enabled = true,
		},
	},
	icons = {
		disabled = "",
		disconnect = " ",
		enabled = "",
		filter = "󰈲",
		negate = " ",
		pause = "(p)",
		play = " (s)",
		run_last = " (r)",
		step_into = " (i)",
		step_out = " (o)",
		step_over = " (d)",
		terminate = " (t)",
	},
})

require("dap-python").setup("uv")

require("dap-go").setup()

local dap = require("dap")
local dapview = require("dap-view")

vim.keymap.set("n", "<leader>ds", function() require("dap").continue() end, { desc = "Start" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.run_to_cursor() end, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dd", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>dr", function() dap.restart() end, { desc = "Restart" })
vim.keymap.set("n", "<leader>dp", function() dap.pause() end, { desc = "Pause" })
vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })

dap.listeners.after.event_initialized["dap-view-config"] = dapview.open
dap.listeners.before.event_terminated["dap-view-config"] = dapview.close

vim.fn.sign_define("DapBreakpoint", { text = "🤔" })
vim.fn.sign_define("DapBreakpointCondition", { text = "👨‍🏭" })
vim.fn.sign_define("DapBreakpointFunction", { text = "🤴🏻" })
vim.fn.sign_define("DapBreakpointRejected", { text = "😡" })
vim.fn.sign_define("DapLogPoint", { text = "🫱" })
vim.fn.sign_define("DapStopped", { text = "🫸🏻" })
