-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local vscode = require("vscode")

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Center cursor after movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- Moving
vim.keymap.set("v", "J", ":m '>+1<CR>gv", { desc = "Move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv", { desc = "Move visual block up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (preserve cursor)" })
vim.keymap.set("n", "oo", "mao<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add blank line below" })
vim.keymap.set("n", "OO", "maO<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add blank line above" })
vim.keymap.set({ "n", "i" }, "<C-Enter>", "<Esc>o", { desc = "jump to the next line" })
vim.keymap.set("n", "<Enter>", "i<Enter><Esc>", { desc = "Enter and back to normal mode" })

-- copy
vim.keymap.set("n", "Y", "yg$", { desc = "Copy from cursor to the end" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"0p', { desc = "Paste from yank register" })

-- Fuzzy Finder (Telescope equivalents) (<leader>f)
vim.keymap.set("n", "<leader>ff", function() vscode.action("workbench.action.quickOpen") end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() vscode.action("workbench.action.findInFiles") end, { desc = "Grep (Global Search)" })
vim.keymap.set("n", "<leader>fb", function() vscode.action("workbench.action.showAllEditors") end, { desc = "Existing Buffers" })
vim.keymap.set("n", "<leader>f.", function() vscode.action("workbench.action.gotoSymbol") end, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>fw", function() vscode.action("workbench.action.showAllSymbols") end, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>fc", function() vscode.action("workbench.action.showCommands") end, { desc = "Show Commands" })

-- Explorer / Sidebar
vim.keymap.set("n", "<leader>ee", function() vscode.action("workbench.view.explorer") end, { desc = "Focus Explorer" })

-- Window Management (<leader>w)
vim.keymap.set("n", "<leader>wv", function() vscode.action("workbench.action.splitEditorRight") end, { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>wh", function() vscode.action("workbench.action.splitEditorDown") end, { desc = "Split Horizontal" })
vim.keymap.set("n", "<leader>wq", function() vscode.action("workbench.action.closeActiveEditor") end, { desc = "Close Current Window" })

-- Navigation (Alt + hjkl) - Directional focus (Editor, Sidebar, Panel)
vim.keymap.set({ "n", "i", "v" }, "<A-h>", function() vscode.action("workbench.action.navigateLeft") end)
vim.keymap.set({ "n", "i", "v" }, "<A-j>", function() vscode.action("workbench.action.navigateDown") end)
vim.keymap.set({ "n", "i", "v" }, "<A-k>", function() vscode.action("workbench.action.navigateUp") end)
vim.keymap.set({ "n", "i", "v" }, "<A-l>", function() vscode.action("workbench.action.navigateRight") end)

-- LSP / General Nav
vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end, { desc = "Go to Definition" })
vim.keymap.set("n", "gr", function() vscode.action("editor.action.goToReferences") end, { desc = "Go to References" })
vim.keymap.set("n", "gi", function() vscode.action("editor.action.goToImplementation") end, { desc = "Go to Implementation" })
vim.keymap.set("n", "gt", function() vscode.action("editor.action.goToTypeDefinition") end, { desc = "Go to Type Definition" })
vim.keymap.set("n", "gl", function() vscode.action("editor.action.showHover") end, { desc = "Show Hover (Diagnostic)" })

-- Git
vim.keymap.set("n", "<leader>go", function() vscode.action("workbench.view.scm") end, { desc = "Open Git View" })

-- Testing
vim.keymap.set("n", "<leader>tn", function() vscode.action("testing.runAtCursor") end, { desc = "Run Test at Cursor" })
vim.keymap.set("n", "<leader>tf", function() vscode.action("testing.runCurrentFile") end, { desc = "Run Test File" })
vim.keymap.set("n", "<leader>ts", function() vscode.action("testing.showMostRecentOutput") end, { desc = "Show Test Output" })

-- Debug
vim.keymap.set("n", "<leader>db", function() vscode.action("editor.debug.action.toggleBreakpoint") end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>ds", function() vscode.action("workbench.action.debug.start") end, { desc = "Start Debugging" })

-- Refactor
vim.keymap.set("n", "<leader>r", function() vscode.action("editor.action.formatDocument") end, { desc = "Format Document" })
vim.keymap.set("n", "<leader>cr", function() vscode.action("editor.action.refactor") end, { desc = "Refactor" })
vim.keymap.set("n", "<leader>ci", function() vscode.action("editor.action.organizeImports") end, { desc = "Organize Imports" })

-- Comment
vim.keymap.set("n", "gcc", function() vscode.action("editor.action.commentLine") end, { desc = "Toggle line comment" })
vim.keymap.set("v", "gc", function() vscode.action("editor.action.commentLine") end, { desc = "Toggle selection comment" })