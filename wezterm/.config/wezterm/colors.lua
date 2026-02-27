local colors = {
	foreground = "#DCD7BA",
	background = "#16161D", -- Kanso Zen Darker Background
	cursor_bg = "#C8C093",
	cursor_border = "#C8C093",
	cursor_fg = "#16161D",
	selection_bg = "#2D4F67",
	selection_fg = "#DCD7BA",
	split = "#16161D",
	compose_cursor = "#6A9589",
	scrollbar_thumb = "#2D4F67",

	ansi = {
		"#090618", -- black
		"#C34043", -- red
		"#76946A", -- green
		"#C0A36E", -- yellow
		"#7E9CD8", -- blue
		"#957FB8", -- magenta
		"#6A9589", -- cyan
		"#DCD7BA", -- white
	},
	brights = {
		"#727169", -- bright black
		"#E82424", -- bright red
		"#98BB6C", -- bright green
		"#E6C384", -- bright yellow
		"#7FB4CA", -- bright blue
		"#938AA9", -- bright magenta
		"#7AA89F", -- bright cyan
		"#DCD7BA", -- bright white
	},

	indexed = {
		[16] = "#FFA066", -- orange
		[17] = "#FF5D62", -- red
	},

	tab_bar = {
		background = "#16161D",
		inactive_tab_edge = "#54546D",
		active_tab = {
			fg_color = "#C8C093",
			bg_color = "#16161D",
			intensity = "Bold",
		},
		inactive_tab = {
			fg_color = "#727169",
			bg_color = "#1F1F28",
		},
		inactive_tab_hover = {
			fg_color = "#DCD7BA",
			bg_color = "#16161D",
		},
		new_tab = {
			fg_color = "#727169",
			bg_color = "#1F1F28",
		},
		new_tab_hover = {
			fg_color = "#DCD7BA",
			bg_color = "#16161D",
			intensity = "Bold",
		},
	},
}

return colors