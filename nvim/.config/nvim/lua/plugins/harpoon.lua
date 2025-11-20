vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.1.9" }, -- v0.1.9 (latest) commit hash
	{ src = "https://github.com/theprimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "[H]arpoon [A]dd" })

vim.keymap.set("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[H]arpoon [M]enu" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "[H]arpoon [P]revious" })

vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "[H]arpoon [N]ext" })
