local vscode = require("vscode")

local M = {}

---Move selected lines up or down and manually recalculate visual selection
---@param direction "Up"|"Down"
function M.move_selection(direction)
	local cursor_line = vim.fn.line("v")
	local cursor_start_line = vim.fn.line(".")

	local start_line = cursor_line
	local end_line = cursor_start_line

	-- Normalize start/end based on movement direction
	if direction == "Up" then
		if start_line < end_line then
			start_line, end_line = end_line, start_line
		end
	else -- "Down"
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
	end

	-- Move lines via VS Code action
	vim.cmd(string.format("call VSCodeCallRange('editor.action.moveLines%sAction', %d, %d, 1)", direction, start_line, end_line))

	-- Calculate and restore visual selection
	if direction == "Up" then
		if end_line > 1 then
			local new_start = start_line - 1
			local new_end = end_line - 1
			-- Exit visual mode and re-select
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
			vim.cmd(string.format("normal! %dGV%dG", new_start, new_end))
		end
	else -- "Down"
		if end_line < vim.api.nvim_buf_line_count(0) then
			local new_start = start_line + 1
			local new_end = end_line + 1
			-- Exit visual mode and re-select
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
			vim.cmd(string.format("normal! %dGV%dG", new_start, new_end))
		end
	end
end

return M
