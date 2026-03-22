local wezterm = require("wezterm")
local tabline_theme = require("tabline_theme")
local M = {}

function M.apply(config)
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = false

	local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	tabline.setup({
		options = {
			theme = tabline_theme,
			section_separators = {
				left = "",
				right = "",
			},
			component_separators = {
				left = "",
				right = "",
			},
			tab_separators = {
				left = "",
				right = "",
			},
		},
		sections = {
			tabline_a = { "mode" },
			tabline_b = { "workspace" },
			tabline_c = { "" },
			tab_active = {
				{ "process" },
			},
			tab_inactive = {
				{ "process" },
			},
			tabline_x = { "ram", "cpu" },
			tabline_y = { "datetime" },
			tabline_z = { "domain" },
		},
		extensions = { "resurrect" },
	})
	tabline.apply_to_config(config)
end

return M
