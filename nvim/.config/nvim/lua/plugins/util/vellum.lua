local pack_builder = require("pack.pack-builder")

vim.pack.add({
	{ src = "https://github.com/blackhat-7/vellum.nvim" },
})

pack_builder.build_plugin("vellum.nvim", "nvim -l build.lua")

require("vellum").setup()

vim.keymap.set("n", "<leader>mp", "<cmd>Vellum<cr>", { desc = "Markdown preview" })
