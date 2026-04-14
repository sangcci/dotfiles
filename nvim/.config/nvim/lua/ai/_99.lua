vim.pack.add({
	{ src = "https://github.com/ThePrimeagen/99" },
})

local _99 = require("99")

_99.setup({
	provider = _99.Providers.GeminiCLIProvider,
	completion = {
		source = "blink",
	},
})

-- Search (주기능: 프로젝트 탐색 → quickfix)
vim.keymap.set("n", "<leader>9s", function() _99.search() end, { desc = "Search project with AI" })

-- Vibe (에이전틱 코딩)
vim.keymap.set("n", "<leader>9b", function() _99.vibe() end, { desc = "Agentic coding mode" })

-- Visual replace (v 모드 전용)
vim.keymap.set("v", "<leader>9v", function() _99.visual() end, { desc = "Visual mode AI assist" })

-- Results / Logs
vim.keymap.set("n", "<leader>9o", function() _99.open() end, { desc = "Open AI results" })
vim.keymap.set("n", "<leader>9l", function() _99.view_logs() end, { desc = "View AI logs" })

-- Cancel
vim.keymap.set("n", "<leader>9x", function() _99.stop_all_requests() end, { desc = "Cancel AI requests" })

-- Model / Provider picker
vim.keymap.set("n", "<leader>9m", function() require("99.extensions.telescope").select_model() end, { desc = "Select AI model" })
vim.keymap.set("n", "<leader>9p", function() require("99.extensions.telescope").select_provider() end, { desc = "Select AI provider" })
