local M = {}

function M.detect()
	if vim.g.vscode then
		return "vscode"
	end
	return os.getenv("NVIM_PROFILE") or "lite"
end

M.current = M.detect()

return M
