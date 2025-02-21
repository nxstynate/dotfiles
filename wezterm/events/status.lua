local wezterm = require("wezterm")

local status = {}

-- Solarized Dark Colors
local colors = {
	bg = "#073642", -- Status bar background
	fg = "#839496", -- Foreground text
	accent_blue = "#268bd2", -- Active section
	accent_green = "#859900", -- Normal mode
	accent_yellow = "#b58900", -- Insert mode
	accent_orange = "#cb4b16", -- Visual mode
	accent_red = "#dc322f", -- Replace mode
}

-- Define modes with corresponding colors
status.modes = {
	search_mode = { icon = "🔍", text = "SEARCH", bg = colors.accent_yellow },
	copy_mode = { icon = "📋", text = "COPY", bg = colors.accent_green },
	font_mode = { icon = "🔠", text = "FONT", bg = colors.accent_blue },
	help_mode = { icon = "❓", text = "HELP", bg = colors.accent_orange },
}

wezterm.on("update-status", function(window, pane)
	local mode = window:active_key_table() or "normal"
	local mode_info = status.modes[mode] or { icon = "🖥", text = "NORMAL", bg = colors.accent_blue }

	-- Get working directory
	local cwd_uri = pane:get_current_working_dir()
	local cwd = "N/A"
	if cwd_uri then
		cwd = cwd_uri:gsub("file://", ""):gsub("%%20", " ") -- Convert file:// path to readable path
	end

	-- Get hostname
	local hostname = wezterm.hostname()

	-- Get battery status
	local battery_status = ""
	local batteries = wezterm.battery_info()
	if batteries and #batteries > 0 then
		for _, battery in ipairs(batteries) do
			local battery_level = string.format("%.0f%%", battery.state_of_charge * 100)
			local battery_icon = "🔋"
			if battery.state_of_charge < 0.2 then
				battery_icon = "⚠️"
			elseif battery.state_of_charge > 0.8 then
				battery_icon = "⚡"
			end
			battery_status = battery_icon .. " " .. battery_level
		end
	end

	-- Triangle separators
	local LEFT_TRIANGLE = utf8.char(0xe0b2) -- 
	local RIGHT_TRIANGLE = utf8.char(0xe0b0) -- 

	-- Format status bar text
	local status_text = wezterm.format({
		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = mode_info.bg } },
		{ Text = LEFT_TRIANGLE }, -- Left separator

		{ Background = { Color = mode_info.bg } },
		{ Foreground = { Color = "#ffffff" } },
		{ Text = string.format(" %s %s ", mode_info.icon, mode_info.text) },

		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = mode_info.bg } },
		{ Text = RIGHT_TRIANGLE }, -- Right separator

		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = colors.fg } },
		{ Text = string.format(" 🏠 %s | 📂 %s | %s ", hostname, cwd, battery_status) },
	})

	-- Set Right Status (Mode Indicator, Hostname, etc.)
	window:set_right_status(status_text)
end)

wezterm.on("update-right-status", function(window, _)
	local prefix = ""

	-- Show leader key indicator
	if window:leader_is_active() then
		prefix = " 🌊" -- Ocean wave icon for active leader
	end

	-- Triangle separators
	local LEFT_TRIANGLE = utf8.char(0xe0b2) -- 
	local RIGHT_TRIANGLE = utf8.char(0xe0b0) -- 

	-- Set Left Status (Tmux-style bar)
	window:set_left_status(wezterm.format({

		{ Background = { Color = colors.accent_blue } },
		{ Foreground = { Color = "#00141A" } },
		{ Text = prefix .. " NXSTYNATE " },

		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = colors.accent_blue } },
		{ Text = RIGHT_TRIANGLE },
	}))
end)

return status
