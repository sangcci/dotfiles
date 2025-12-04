-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Timeout
vim.opt.timeoutlen = 300

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Window
vim.keymap.set({ "n", "t" }, "<M-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set({ "n", "t" }, "<M-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set({ "n", "t" }, "<M-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set({ "n", "t" }, "<M-l>", "<cmd>NavigatorRight<cr>")
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "Split Horizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Center cursor after movements
vim.keymap.set("n", "<C-d>", "<C-d>")
vim.keymap.set("n", "<C-u>", "<C-u>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Moving
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move visualized code to go up 1" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move visualized code to go down 1" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (preserve cursor)" })
vim.keymap.set("n", "oo", "mao<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add blank line below" })
vim.keymap.set("n", "OO", "maO<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add blank line above" })
vim.keymap.set({ "n", "i" }, "<C-Enter>", "<Esc>o", { desc = "jump to the next line" })
vim.keymap.set("n", "<Enter>", "i<Enter><Esc>", { desc = "Enter and back to normal mode" })

-- copy
vim.keymap.set("n", "Y", "yg$", { desc = "Copy from cursor to the end" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"0p', { desc = "Paste from yank register" })

-- substitute
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Substitute" })

-- !! Don't use
vim.keymap.set("n", "Q", "<nop>")

-- Code (LspAttach)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		-- open diagnositcs on float window
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

		-- using conform plugins
		vim.keymap.set("n", "<leader>r", function()
			require("conform").format({ bufnr = args.buf, async = true, lsp_fallback = true })
		end, vim.tbl_extend("force", opts, { desc = "format" }))
	end,
})

-- TODO: we have to get used to this keymap setting.

-- goto_next_start
vim.keymap.set({ "n", "x", "o" }, "]m", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]s", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end)
vim.keymap.set({ "n", "x", "o" }, "]z", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]C", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[s", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@local.scope", "locals")
end)
vim.keymap.set({ "n", "x", "o" }, "[z", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[C", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)

-- undutree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })

-- Debug
local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Breakpoint" })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Start" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "Close" })

-- Explorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Explorer Oil" })

-- Find
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>f.", builtin.lsp_document_symbols, { desc = "Documents Symbols" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Existing Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tegs" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
vim.keymap.set(
	"n",
	"<leader>fT",
	"<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
	{ desc = "[T(c)]odos (TODO/FIX only)" }
)

-- Git
vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Diffview Close" })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "Diffview File History" })
vim.keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", { desc = "Diffview File History %" })

-- Todo
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
vim.keymap.set("n", "]e", function()
	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
end, { desc = "Next error/warning todo" })
vim.keymap.set("n", "[e", function()
	require("todo-comments").jump_prev({ keywords = { "ERROR", "WARNING" } })
end, { desc = "Previous error/warning todo" })

-- Zettelkasten
local opts = { noremap = true, silent = false }
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)
