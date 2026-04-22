vim.pack.add({
	{ src = "https://github.com/goolord/alpha-nvim" },
})

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("<leader>e", "  Open Neo Tree", "<cmd>Neotree<cr>"),
	dashboard.button("<leader>ff", "  Find files", "<cmd>Telescope find_files<cr>"),
	dashboard.button("<leader>fg", "  Live grep", "<cmd>Telescope live_grep<cr>"),
}

require("alpha").setup(dashboard.config)
