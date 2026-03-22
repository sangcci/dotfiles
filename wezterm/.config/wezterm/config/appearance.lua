local wezterm = require("wezterm")
local mux = wezterm.mux
local colors = require("colors")
local M = {}

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

function M.apply(config)
	config.color_scheme = "Kanso"
	config.force_reverse_video_cursor = true
	config.colors = colors

	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
	config.window_decorations = "RESIZE"
	config.macos_window_background_blur = 40
	config.window_background_opacity = 0.9
	config.native_macos_fullscreen_mode = false
end

return M
