-- <C-h/j/k/l>로 nvim split을 이동하고, 가장자리에서는 herdr pane으로 넘어간다.
-- herdr TUI 안에서는 herdr-nvim-nav 플러그인을, herdr app 안에서는 아래 구현을 쓴다.
-- herdr 밖에서는 둘 다 없어 nvim split 이동만 동작한다.
if (vim.env.HERDR_PANE_ID or "") ~= "" then
	vim.pack.add({
		{ src = "https://github.com/aimdevlee/herdr-nvim-nav" },
	})
	require("herdr-nvim-nav").setup({ with_tmux = false })
	return
end

local terminal_id = vim.env.HC_TERMINAL_ID or ""
if terminal_id == "" then
	return
end

-- app의 nvim-nav mod가 이 파일로 터미널에 nvim이 떠 있는지 확인하고, 파일 열기에도 같은 주소를 쓴다.
local marker = (vim.env.XDG_CACHE_HOME or vim.fn.expand("~/.cache")) .. "/herdr-app/nvim/" .. terminal_id
local group = vim.api.nvim_create_augroup("HerdrAppNav", { clear = true })

local function write_marker()
	vim.fn.mkdir(vim.fn.fnamemodify(marker, ":h"), "p")
	vim.fn.writefile({ vim.v.servername }, marker)
end

write_marker()
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = group,
	callback = function()
		vim.fn.delete(marker)
	end,
})

local function go(direction, wincmd)
	return function()
		local before = vim.api.nvim_get_current_win()
		vim.cmd("wincmd " .. wincmd)
		if vim.api.nvim_get_current_win() == before then
			vim.system({ "herdr-app", "do", "pane.go", vim.json.encode({ direction = direction }) })
		end
	end
end

vim.keymap.set("n", "<C-h>", go("left", "h"), { desc = "Window or pane left" })
vim.keymap.set("n", "<C-j>", go("down", "j"), { desc = "Window or pane down" })
vim.keymap.set("n", "<C-k>", go("up", "k"), { desc = "Window or pane up" })
vim.keymap.set("n", "<C-l>", go("right", "l"), { desc = "Window or pane right" })
