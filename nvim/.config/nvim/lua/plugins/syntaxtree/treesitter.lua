vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

require("nvim-treesitter")
	.install({
		"javascript",
		"typescript",
		"java",
		"gradle",
		"python",
		"c",
		"go",
		"gomod",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
	})
	:wait(30000)
require("nvim-treesitter").update()

-- auto-start highlights & indentation
vim.api.nvim_create_autocmd("FileType", {
	desc = "User: enable treesitter highlighting",
	callback = function(ctx)
		-- highlights
		local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

		-- indent
		local noIndent = {}
		if hasStarted and not vim.list_contains(noIndent, ctx.match) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

require("nvim-treesitter-textobjects").setup({
	move = {
		-- whether to set jumps in the jumplist
		set_jumps = true,
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Handle nvim-treesitter updates",
	group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
	callback = function(event)
		if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
			vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
			---@diagnostic disable-next-line: param-type-mismatch
			local ok = pcall(vim.cmd, "TSUpdate")
			if ok then
				vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
			else
				vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
			end
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		-- remove error = false when nvim 0.12+ is default
		if vim.treesitter.get_parser(nil, nil, { error = false }) then
			vim.treesitter.start()
		end
	end,
})

-- TODO: we have to get used to this keymap setting.

-- goto_next_start
vim.keymap.set({ "n", "x", "o" }, "]m", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]s", function() require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals") end)
vim.keymap.set({ "n", "x", "o" }, "]z", function() require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds") end)

vim.keymap.set({ "n", "x", "o" }, "]M", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end)

vim.keymap.set({ "n", "x", "o" }, "[m", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[s", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@local.scope", "locals") end)
vim.keymap.set({ "n", "x", "o" }, "[z", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds") end)

vim.keymap.set({ "n", "x", "o" }, "[M", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end)
