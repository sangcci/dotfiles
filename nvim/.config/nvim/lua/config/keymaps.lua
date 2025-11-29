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
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "Split [H]orizontal" })

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
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
-- goto_next_end
vim.keymap.set({ "n", "x", "o" }, "]M", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)
-- goto_previous_start
vim.keymap.set({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
-- goto_previous_end
vim.keymap.set({ "n", "x", "o" }, "[M", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)
-- You can also pass a list to group multiple queries.
vim.keymap.set({ "n", "x", "o" }, "]o", function()
	require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ "n", "x", "o" }, "]s", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end)
vim.keymap.set({ "n", "x", "o" }, "]z", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end)
vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end)

-- undutree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree" })

-- [D]ebug
local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[B]reakpoint" })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[S]tart" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step [O]ver" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step [I]nto" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step [O(c)]out" })
vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[C]lose" })

-- [E]xplorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "[E]xplorer Oil" })

-- [F]ind
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[G]rep" })
vim.keymap.set("n", "<leader>f.", builtin.lsp_document_symbols, { desc = "Documents Symbols" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "[W]orkspace Symbols" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Existing [B]uffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[H]elp tegs" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[T]odos" })
vim.keymap.set(
	"n",
	"<leader>fT",
	"<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
	{ desc = "[T(c)]odos (TODO/FIX only)" }
)

-- [T]odo
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
