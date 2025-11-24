local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- font
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
})
config.font_size = 15.0
config.line_height = 1.4

-- colorscheme
config.color_scheme = "Catppuccin Macchiato"

-- tab bar
config.use_fancy_tab_bar = false -- don't use the fancy tab bar
config.hide_tab_bar_if_only_one_tab = false

-- window style
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }

-- keymap
config.leader = { key = "x", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- multiplexing
	{ key = "x", mods = "LEADER", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- movement
	{ key = "h", mods = "CTRL", action = action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = action.ActivatePaneDirection("Right") },
	-- tab
	{ key = "c", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = action.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = action.ActivateTabRelative(-1) },
}

return config
