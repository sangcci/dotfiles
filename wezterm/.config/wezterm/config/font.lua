local wezterm = require("wezterm")
local M = {}

function M.apply(config)
	config.font = wezterm.font({
		family = "D2CodingLigature Nerd Font Mono",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disable ligatures
	})
	config.font_size = 15
	config.line_height = 1.25
end

return M
