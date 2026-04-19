vim.pack.add({
	{ src = "https://github.com/goolord/alpha-nvim" },
})

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("<leader>e",  "  Yazi (current file)", "<cmd>Yazi<cr>"),
	dashboard.button("<leader>E",  "  Yazi (cwd)",          "<cmd>Yazi cwd<cr>"),
	dashboard.button("<leader>ff", "  Find files",          "<cmd>Telescope find_files<cr>"),
	dashboard.button("<leader>fg", "  Live grep",           "<cmd>Telescope live_grep<cr>"),
}

require("alpha").setup(dashboard.config)
