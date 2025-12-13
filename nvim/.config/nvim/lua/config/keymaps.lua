-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Timeout
vim.opt.timeoutlen = 300

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Window
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
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<Left><Left><Left>", { desc = "Substitute" })

-- !! Don't use
vim.keymap.set("n", "Q", "<nop>")
