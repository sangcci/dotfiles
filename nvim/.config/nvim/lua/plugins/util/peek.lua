local pack_builder = require("pack.pack-builder")

vim.pack.add({
	{ src = "https://github.com/toppair/peek.nvim" },
})

pack_builder.build_plugin("peek.nvim", "deno task --quiet build:fast")

require("peek").setup()

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
