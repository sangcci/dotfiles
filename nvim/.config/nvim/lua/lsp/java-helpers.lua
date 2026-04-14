vim.pack.add({
	{ src = "https://github.com/NickJAllen/java-helpers.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("java-helpers").setup({
	new_file = {
		java_source_dirs = { "src/main/java", "src/test/java", "src" },
		should_format = true,
	},
})

-- New file creation
vim.keymap.set("n", "<leader>jn", "<cmd>JavaHelpersNewFile<cr>", { desc = "New Java Type" })

-- Stack trace navigation
vim.keymap.set("n", "<leader>jg", "<cmd>JavaHelpersGoToStackTraceLine<cr>", { desc = "Go to stack trace line" })
vim.keymap.set("n", "<leader>jG", "<cmd>JavaHelpersGoToStackTraceLine +<cr>", { desc = "Go to stack trace line (clipboard)" })
-- NOTE: <leader>jp, jP, js (JavaHelpersPick*) require snacks.nvim — add separately if needed
vim.keymap.set("n", "[j", "<cmd>JavaHelpersGoUpStackTrace<cr>", { desc = "Go up stack trace" })
vim.keymap.set("n", "]j", "<cmd>JavaHelpersGoDownStackTrace<cr>", { desc = "Go down stack trace" })
vim.keymap.set("n", "[J", "<cmd>JavaHelpersGoToPrevStackTrace<cr>", { desc = "Go to prev stack trace" })
vim.keymap.set("n", "]J", "<cmd>JavaHelpersGoToNextStackTrace<cr>", { desc = "Go to next stack trace" })
vim.keymap.set("n", "<leader>jt", "<cmd>JavaHelpersGoToTopOfStackTrace<cr>", { desc = "Go to top of stack trace" })
vim.keymap.set("n", "<leader>jb", "<cmd>JavaHelpersGoToBottomOfStackTrace<cr>", { desc = "Go to bottom of stack trace" })
vim.keymap.set("n", "<leader>jq", "<cmd>JavaHelpersSendStackTraceToQuickfix<cr>", { desc = "Stack trace to quickfix" })
vim.keymap.set("n", "<leader>jd", "<cmd>JavaHelpersDeobfuscate<cr>", { desc = "Deobfuscate stack trace" })
vim.keymap.set("n", "<leader>jD", "<cmd>JavaHelpersDeobfuscate +<cr>", { desc = "Deobfuscate stack trace (clipboard)" })
-- NOTE: <leader>jo (JavaHelpersSelectObfuscationFile) requires snacks.nvim — add separately if needed
