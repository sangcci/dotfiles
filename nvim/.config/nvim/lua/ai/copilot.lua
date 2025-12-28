vim.pack.add({
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/giuxtaposition/blink-cmp-copilot" },
	{ src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
})
-- NOTE: After installing, run :Copilot setup to complete the setup.

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
