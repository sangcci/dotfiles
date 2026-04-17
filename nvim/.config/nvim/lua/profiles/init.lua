local M = {}

M.current = os.getenv("NVIM_PROFILE") or "lite"

return M
