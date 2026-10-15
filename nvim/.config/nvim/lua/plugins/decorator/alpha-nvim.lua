vim.pack.add({
	{ src = "https://github.com/goolord/alpha-nvim" },
})

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("-", "  Focus file explorer", "<cmd>Neotree filesystem reveal_force_cwd<cr>"),
	dashboard.button("<leader>ff", "  Find files", "<cmd>Telescope find_files<cr>"),
	dashboard.button("<leader>fp", "  Find projects", "<cmd>Telescope project display_type=full<cr>"),
	dashboard.button("<leader>fg", "  Live grep", "<cmd>Telescope live_grep<cr>"),
	dashboard.button("<leader>gg", "  Open Diffview", "<cmd>DiffviewOpen<cr>"),
}

require("alpha").setup(dashboard.config)
