local wezterm = require("wezterm")
local projects = require("projects")
local config = wezterm.config_builder()

-- Colors --
local flexoki_colors = {
  bg_superdark = "#060606",
  bg = "#100F0F",
  bg_2 = "#1C1B1A",
  tx = "#CECDC3",
  tx_3 = "#575653",
  ui = "#282726",
  ui_2 = "#343331",
}

config.color_scheme = "flexoki-dark"
config.colors = {
	background = flexoki_colors.bg,
	tab_bar = {
		active_tab = {
			bg_color = flexoki_colors.ui,
			fg_color = flexoki_colors.tx,
		},
		inactive_tab = {
			bg_color = flexoki_colors.bg,
			fg_color = flexoki_colors.tx_3,
		},
		new_tab = {
			bg_color = flexoki_colors.bg,
			fg_color = flexoki_colors.tx_3,
		},
		new_tab_hover = {
			bg_color = flexoki_colors.tx,
			fg_color = flexoki_colors.bg,
		},
	},
	scrollbar_thumb = flexoki_colors.ui_2,
}

-- Visuals --
config.font = wezterm.font({ family = "JetBrains Mono", weight = "Medium" })
config.font_size = 12
config.freetype_load_flags = "NO_HINTING"

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = 5,
	right = 10,
	top = 5,
	bottom = 0,
}
config.window_frame = {
	active_titlebar_bg = flexoki_colors.bg,
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
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Option + left/right moves a word left or right
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
	{ key = "t", mods = "SUPER", action = wezterm.action.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
	{ key = "p", mods = "LEADER", action = projects.choose_project() },
	{ key = "f", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

return config
