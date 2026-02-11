vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/kndndrj/nvim-dbee" },
})

local dbee = require("dbee")
local install = require("dbee.install")
if vim.fn.executable(install.bin()) == 0 then
	dbee.install()
end
dbee.setup()
