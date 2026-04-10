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
vim.keymap.set("n", "<leader>9s", function() _99.search() end)

-- Vibe (에이전틱 코딩)
vim.keymap.set("n", "<leader>9b", function() _99.vibe() end)

-- Visual replace (v 모드 전용)
vim.keymap.set("v", "<leader>9v", function() _99.visual() end)

-- Results / Logs
vim.keymap.set("n", "<leader>9o", function() _99.open() end)
vim.keymap.set("n", "<leader>9l", function() _99.view_logs() end)

-- Cancel
vim.keymap.set("n", "<leader>9x", function() _99.stop_all_requests() end)

-- Model / Provider picker
vim.keymap.set("n", "<leader>9m", function() require("99.extensions.telescope").select_model() end)
vim.keymap.set("n", "<leader>9p", function() require("99.extensions.telescope").select_provider() end)
