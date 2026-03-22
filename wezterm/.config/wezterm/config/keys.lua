local wezterm = require("wezterm")
local action = wezterm.action
local M = {}

-- NOTE: https://github.com/numToStr/Navigator.nvim/wiki/WezTerm-Integration
local function is_inside_vim(pane)
	local tty = pane:get_tty_name()
	if tty == nil then
		return false
	end

	local success, stdout, stderr = wezterm.run_child_process({
		"sh",
		"-c",
		"ps -o state= -o comm= -t" .. wezterm.shell_quote_arg(tty) .. " | " .. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'",
	})

	return success
end

local function is_outside_vim(pane) return not is_inside_vim(pane) end

local function bind_if(cond, key, mods, a)
	local function callback(win, pane)
		if cond(pane) then
			win:perform_action(a, pane)
		else
			win:perform_action(action.SendKey({ key = key, mods = mods }), pane)
		end
	end

	return { key = key, mods = mods, action = wezterm.action_callback(callback) }
end

function M.apply(config)
	config.leader = { key = "s", mods = "ALT", timeout_milliseconds = 1000 }
	config.keys = {
		-- multiplexing
		{ key = "x", mods = "ALT", action = action.CloseCurrentPane({ confirm = false }) },
		{ key = "H", mods = "ALT", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "V", mods = "ALT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- movement
		bind_if(is_outside_vim, "h", "ALT", action.ActivatePaneDirection("Left")),
		bind_if(is_outside_vim, "j", "ALT", action.ActivatePaneDirection("Down")),
		bind_if(is_outside_vim, "k", "ALT", action.ActivatePaneDirection("Up")),
		bind_if(is_outside_vim, "l", "ALT", action.ActivatePaneDirection("Right")),
		-- tab
		{ key = "c", mods = "ALT", action = action.SpawnTab("CurrentPaneDomain") },
		{ key = "n", mods = "ALT", action = action.ActivateTabRelative(1) },
		{ key = "p", mods = "ALT", action = action.ActivateTabRelative(-1) },
	}
end

return M
