vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

require("nvim-treesitter")
	.install({
		"javascript",
		"typescript",
		"java",
		"kotlin",
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
		"nix",
		"json",
	})
	:wait(30000)

-- Enable highlighting and indentation when a parser is available.
vim.api.nvim_create_autocmd("FileType", {
	desc = "User: enable treesitter highlighting",
	callback = function(ctx)
		if vim.treesitter.highlighter.active[ctx.buf] or pcall(vim.treesitter.start, ctx.buf) then
			vim.bo[ctx.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

require("nvim-treesitter-textobjects").setup({
	move = {
		-- whether to set jumps in the jumplist
		set_jumps = true,
	},
})

-- TODO: we have to get used to this keymap setting.

-- goto_next_start
vim.keymap.set({ "n", "x", "o" }, "]m", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
vim.keymap.set({ "n", "x", "o" }, "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
vim.keymap.set({ "n", "x", "o" }, "]s", function() require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals") end, { desc = "Next scope start" })
vim.keymap.set({ "n", "x", "o" }, "]z", function() require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds") end, { desc = "Next fold start" })

vim.keymap.set({ "n", "x", "o" }, "]M", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, { desc = "Next function end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })

vim.keymap.set({ "n", "x", "o" }, "[m", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, { desc = "Previous function start" })
vim.keymap.set({ "n", "x", "o" }, "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, { desc = "Previous class start" })
vim.keymap.set({ "n", "x", "o" }, "[s", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@local.scope", "locals") end, { desc = "Previous scope start" })
vim.keymap.set({ "n", "x", "o" }, "[z", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds") end, { desc = "Previous fold start" })

vim.keymap.set({ "n", "x", "o" }, "[M", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, { desc = "Previous function end" })
vim.keymap.set({ "n", "x", "o" }, "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, { desc = "Previous class end" })
