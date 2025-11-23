local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- font
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
})
config.font_size = 17.0
config.line_height = 1.4

-- colorscheme
config.color_scheme = "Catppuccin Macchiato"

-- window style
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }

-- cursor style
config.default_cursor_style = "BlinkingBar"

-- keymap

return config
