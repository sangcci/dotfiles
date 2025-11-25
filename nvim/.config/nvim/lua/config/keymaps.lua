-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Window navigation
--vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Navigate Left" })
--vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Navigate Right" })
--vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Naviagte Down" })
--vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Navigate Up" })

vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>NavigatorRight<cr>")

-- [W]indow
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

-- [C]ode (LspAttach)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set(
			"n",
			"<leader>ch",
			vim.lsp.buf.hover,
			vim.tbl_extend("force", opts, { desc = "[H]over Documentation" })
		)
		vim.keymap.set(
			"n",
			"<leader>cd",
			vim.lsp.buf.definition,
			vim.tbl_extend("force", opts, { desc = "[D]efinition" })
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "[A]ctions" })
		)
		vim.keymap.set(
			"n",
			"<leader>cr",
			require("telescope.builtin").lsp_references,
			vim.tbl_extend("force", opts, { desc = "[R]eferences" })
		)
		vim.keymap.set(
			"n",
			"<leader>ci",
			require("telescope.builtin").lsp_implementations,
			vim.tbl_extend("force", opts, { desc = "[I]mplementations" })
		)
		vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "[R]ename" }))
		-- using conform plugins
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ bufnr = args.buf, async = true, lsp_fallback = true })
		end, vim.tbl_extend("force", opts, { desc = "re[F]ormat" }))

		-- Diagnostics
		vim.keymap.set(
			"n",
			"<leader>ce",
			vim.diagnostic.open_float,
			vim.tbl_extend("force", opts, { desc = "Show diagnostics [E]" })
		)
		vim.keymap.set(
			"n",
			"<leader>cq",
			vim.diagnostic.setloclist,
			vim.tbl_extend("force", opts, { desc = "Diagnostics to loclist [Q]" })
		)
	end,
})
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

-- TreeSetter
-- vim.keymap.set("n", "<leader>i", "<cmd>InspectTree<CR>", { desc = "[T]reeseitter [I]nspect" })
