-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Navigate Left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Navigate Right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Naviagte Down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Navigate Up" })

-- split window
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Center cursor after movements
vim.keymap.set("n", "<C-d>", "<C-d>")
vim.keymap.set("n", "<C-u>", "<C-u>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
