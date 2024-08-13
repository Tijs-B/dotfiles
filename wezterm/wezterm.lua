local wezterm = require("wezterm")
local config = wezterm.config_builder()

local color_scheme = "OneDark (Gogh)"
local onedark = wezterm.color.get_builtin_schemes()[color_scheme]

local bg_active = onedark.background
local fg_active = onedark.foreground
local bg_inactive = "#15191F"
local fg_inactive = "#3c414a"

config.color_scheme = color_scheme
config.font = wezterm.font({ family = "MesloLGLDZ Nerd Font Mono" })
config.font_size = 12

config.colors = {
	tab_bar = {
		background = bg_active,
		active_tab = {
			bg_color = bg_active,
			fg_color = fg_active,
		},
		inactive_tab = {
			bg_color = bg_inactive,
			fg_color = fg_inactive,
		},
		new_tab = {
			bg_color = bg_inactive,
			fg_color = fg_inactive,
		},
		new_tab_hover = {
			bg_color = bg_active,
			fg_color = fg_active,
		},
	},
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	active_titlebar_bg = bg_inactive,
}
config.enable_scroll_bar = true

config.freetype_load_flags = "NO_HINTING"

config.adjust_window_size_when_changing_font_size = false

return config
