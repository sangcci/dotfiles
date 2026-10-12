vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		local data = event.data
		if data.spec.name ~= "sqmeow.nvim" or (data.kind ~= "install" and data.kind ~= "update") then
			return
		end

		vim.schedule(function() require("sqmeow").install() end)
	end,
})

vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim",
	{
		src = "https://github.com/2giosangmitom/sqmeow.nvim",
		version = vim.version.range(">=0.0.0"), -- follow release tags
	},
})

vim.keymap.set("n", "<leader>Dd", "<cmd>Sqmeow toggle<cr>", { desc = "Toggle database drawer" })
vim.keymap.set("n", "<leader>Dc", "<cmd>Sqmeow cancel<cr>", { desc = "Cancel database query" })
vim.keymap.set("n", "<leader>Da", "<cmd>Sqmeow add<cr>", { desc = "Add database connection" })
vim.keymap.set("n", "<leader>Ds", "<cmd>Sqmeow scratch<cr>", { desc = "New database scratchpad" })
