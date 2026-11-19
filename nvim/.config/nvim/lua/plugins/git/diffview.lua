vim.pack.add({
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local actions = require("diffview.actions")
require("diffview").setup({
	file_panel = {
		win_config = { position = "right" },
	},
	keymaps = {
		view = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
		file_panel = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
		file_history_panel = {
			["<C-n>"] = actions.select_next_entry,
			["<C-p>"] = actions.select_prev_entry,
		},
	},
})

vim.keymap.set("n", "<leader>gg", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Open file history" })
vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "Open current file history" })

-- Base branch of the current branch's PR, falling back to the repository default branch.
local function review_base()
	local pr = vim.system({ "gh", "pr", "view", "--json", "baseRefName", "-q", ".baseRefName" }, { text = true }):wait()
	if pr.code == 0 and vim.trim(pr.stdout) ~= "" then
		return vim.trim(pr.stdout)
	end
	local head = vim.system({ "git", "symbolic-ref", "--short", "refs/remotes/origin/HEAD" }, { text = true }):wait()
	if head.code == 0 then
		return (vim.trim(head.stdout):gsub("^origin/", ""))
	end
end

-- Open the PR diff (merge base..HEAD) against local files so LSP works on the right side.
vim.keymap.set("n", "<leader>gr", function()
	local base = review_base()
	if not base then
		vim.notify("Could not determine the base branch", vim.log.levels.ERROR)
		return
	end
	vim.notify("Fetching origin/" .. base)
	vim.system({ "git", "fetch", "origin", base }, { text = true }, function(fetch)
		vim.schedule(function()
			if fetch.code ~= 0 then
				vim.notify("git fetch failed; using the local origin/" .. base, vim.log.levels.WARN)
			end
			vim.cmd("DiffviewOpen origin/" .. base .. "...HEAD --imply-local")
		end)
	end)
end, { desc = "Review branch against PR base" })

vim.cmd([[cnoreabbrev <expr> q getcmdtype() ==# ':' && getcmdline() ==# 'q' && luaeval("require('plugins.git.gitsigns').has_diff_window()") ? 'GitsignsDiffClose' : (getcmdtype() ==# ':' && getcmdline() ==# 'q' && luaeval("require('diffview.lib').get_current_view() ~= nil") ? 'DiffviewClose' : 'q')]])
