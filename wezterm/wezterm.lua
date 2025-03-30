local wezterm = require("wezterm")
local colors = require("colors.colors")
local config = {}

-- cursor
config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_ease_out = "EaseOut"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.enable_kitty_graphics = true

-- Appearance Settings
-- config.font = wezterm.font("BlexMono Nerd Font Mono", { weight = "Regular" })
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" })
-- config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" })
config.dpi = 144
config.font_size = 12.0
-- config.freetype_render_target = "HorizontalLcd" -- Improves subpixel rendering
config.freetype_load_flags = "NO_HINTING" -- Alternative option for cleaner text
config.line_height = 1.05
-- Solarized Osaka:
config.colors = colors
-- config.color_scheme = "Solarized Dark - Patched"
-- config.color_scheme = "Gruvbox dark, hard (base16)"
config.color_scheme = "rose-pine"
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
-- config.win32_system_backdrop = "Tabbed"
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.show_tab_index_in_tab_bar = false
config.use_resize_increments = true
-- config.allow_square_glyphs_to_overflow_width = "Always"
-- config.enable_scrollbar = false

-- Background Color to Keep Darkness (Fix Washed Out Acrylic)
-- config.colors = {
-- background = "#101010",
-- }

-- Increase color vibrancy
config.force_reverse_video_cursor = true
config.adjust_window_size_when_changing_font_size = false
config.inactive_pane_hsb = {
	saturation = 1.0, -- Keep saturation the same (no dimming)
	brightness = 1.0, -- Keep brightness the same (fully visible text)
}

-- Performance Settings (GPU & FPS)
config.term = "xterm-256color"
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 144
config.underline_thickness = "1.5pt"

-- Default Shell Setup
local os_name = wezterm.target_triple
if os_name:find("windows") then
	-- Check for PowerShell Core (`pwsh.exe`) first, then fallback to `powershell.exe`
	if wezterm.run_child_process({ "where.exe", "pwsh" }) then
		config.default_prog = { "pwsh.exe", "-NoLogo" }
	else
		config.default_prog = { "powershell.exe", "-NoLogo" }
	end
else
	config.default_prog = { "/bin/zsh", "-l" }
end

-- Launch Menu for Quick Access
-- config.launch_menu = {}
-- if os_name:find("windows") then
-- table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })
-- table.insert(config.launch_menu, { label = "PowerShell Core", args = { "pwsh.exe", "-NoLogo" } })
-- table.insert(
-- 	config.launch_menu,
-- 	{ label = "WSL (Fish Shell)", args = { "wsl.exe", "-d", "Ubuntu", "--exec", "fish", "-l" } }
-- )
-- end

-- Set Leader Key to CTRL + T
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }

-- Vim/Tmux-Like Keybindings with Updated Leader Key
config.keys = {
	-- Pane Navigation (Vim-like)
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Pane Splitting (Leader + `-` for Horizontal, `=` for Vertical)
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "=", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Close Pane
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- Resize Panes (CTRL + SHIFT + Arrows)
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	-- Window/Tab Management
	{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

	-- Toggle Fullscreen
	{ key = "f", mods = "LEADER", action = wezterm.action.ToggleFullScreen },

	-- Launch Ubuntu
	{
		key = "u",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({ args = { "wsl.exe", "-d", "Ubuntu" } }),
	},
}

return config
