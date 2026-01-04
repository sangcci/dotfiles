local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- font
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font Mono",
	weight = "Thin",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
})
config.font_size = 13.0
config.line_height = 1.4

-- colorscheme
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
-- config.colors = theme.colors()
-- config.window_frame = theme.window_frame()
config.force_reverse_video_cursor = true
config.colors = {
	foreground = "#c5c9c5",
	background = "#181616",

	cursor_bg = "#C8C093",
	cursor_fg = "#C8C093",
	cursor_border = "#C8C093",

	selection_fg = "#C8C093",
	selection_bg = "#2D4F67",

	scrollbar_thumb = "#16161D",
	split = "#16161D",

	ansi = {
		"#0D0C0C",
		"#C4746E",
		"#8A9A7B",
		"#C4B28A",
		"#8BA4B0",
		"#A292A3",
		"#8EA4A2",
		"#C8C093",
	},
	brights = {
		"#A6A69C",
		"#E46876",
		"#87A987",
		"#E6C384",
		"#7FB4CA",
		"#938AA9",
		"#7AA89F",
		"#C5C9C5",
	},
}

-- tab bar
config.use_fancy_tab_bar = false -- don't use the fancy tab bar
config.hide_tab_bar_if_only_one_tab = false

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = config.colors,
	},
	extensions = { "resurrect" },
})
-- tabline.apply_to_config(config)

-- window style
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"
-- config.macos_window_background_blur = 40
-- config.window_background_opacity = 0.9
config.native_macos_fullscreen_mode = false

-- keymap
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

tabline.apply_to_config(config)
return config
