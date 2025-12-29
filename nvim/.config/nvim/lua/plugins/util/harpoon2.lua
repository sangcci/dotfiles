vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

require("harpoon").setup({})

vim.keymap.set("n", "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Add file to harpoon" })

vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "Go to harpoon file 1" })
vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "Go to harpoon file 2" })
vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "Go to harpoon file 3" })
vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "Go to harpoon file 4" })

vim.keymap.set("n", "<leader>P", function() require("harpoon"):list():prev() end, { desc = "Go to previous harpoon file" })
vim.keymap.set("n", "<leader>N", function() require("harpoon"):list():next() end, { desc = "Go to next harpoon file" })
