local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors --
local bg_active = "#21252b"
local fg_active = "#abb2bf"
local bg_inactive = "#15191F"
local fg_inactive = "#3c414a"

config.color_scheme = "OneDark (Gogh)"
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
	-- Orignal foreground: #5c6370
	foreground = fg_active,
}

-- Visuals --
config.font = wezterm.font({ family = "JetBrains Mono", weight = "Medium" })
config.font_size = 12
config.freetype_load_flags = "NO_HINTING"

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0,
}
config.window_frame = {
	active_titlebar_bg = bg_inactive,
}

config.enable_scroll_bar = true

config.initial_rows = 30
config.initial_cols = 120

-- Behaviour
config.hide_mouse_cursor_when_typing = false
config.adjust_window_size_when_changing_font_size = false
config.use_resize_increments = true
config.scrollback_lines = 20000000

-- Keys
config.keys = {
	-- Option + left/right moves a word left or right
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
	{ key = "t", mods = "SUPER", action = wezterm.action.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
}

return config
