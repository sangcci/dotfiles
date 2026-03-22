local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("config.font").apply(config)
require("config.appearance").apply(config)
require("config.tabbar").apply(config)
require("config.keys").apply(config)

return config
