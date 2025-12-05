local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- font
config.font = wezterm.font({
	family = "Iosevka Nerd Font",
	weight = "Light",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
})
config.font_size = 14.0
config.line_height = 1.2

-- colorscheme
config.color_scheme = "Github Dark"

-- tab bar
config.use_fancy_tab_bar = false -- don't use the fancy tab bar
config.hide_tab_bar_if_only_one_tab = false
config.colors = {
	tab_bar = {
		background = "#0d1117", -- Github Dark background

		active_tab = {
			bg_color = "#1f6feb", -- Github blue accent
			fg_color = "#f0f6fc",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#161b22",
			fg_color = "#8b949e",
		},

		inactive_tab_hover = {
			bg_color = "#21262d",
			fg_color = "#c9d1d9",
		},

		new_tab = {
			bg_color = "#161b22",
			fg_color = "#8b949e",
		},

		new_tab_hover = {
			bg_color = "#21262d",
			fg_color = "#c9d1d9",
		},
	},
}

-- window style
config.window_decorations = "RESIZE|TITLE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 5
-- config.window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }

-- keymap
-- NOTE: https://github.com/numToStr/Navigator.nvim/wiki/WezTerm-Integration
local act = wezterm.action
local function isViProcess(pane)
	-- get_foreground_process_name On Linux, macOS and Windows,
	-- the process can be queried to determine this path. Other operating systems
	-- (notably, FreeBSD and other unix systems) are not currently supported
	return pane:get_foreground_process_name():find("n?vim") ~= nil or pane:get_title():find("n?vim") ~= nil
end
local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds you set in Neovim.
			act.SendKey({ key = vim_direction, mods = "ALT" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end
wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

config.leader = { key = "s", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	-- multiplexing
	{ key = "x", mods = "ALT", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "H", mods = "ALT", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "V", mods = "ALT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- movement
	{ key = "h", mods = "ALT", action = act.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "ALT", action = act.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "ALT", action = act.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "ALT", action = act.EmitEvent("ActivatePaneDirection-right") },
	-- tab
	{ key = "c", mods = "ALT", action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "ALT", action = action.ActivateTabRelative(1) },
	{ key = "p", mods = "ALT", action = action.ActivateTabRelative(-1) },
}

return config
