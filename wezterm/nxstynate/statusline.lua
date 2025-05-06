-- nxstynate/statusline.lua
local wezterm = require("wezterm")

local M = {}
local color01 = "#2a273f"
local color02 = "#e0def4"
local color03 = "#ea9a97"

function M.apply(config)
	config.enable_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_and_split_indices_are_zero_based = false
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.tab_max_width = 16
	config.colors = config.colors or {}

	config.colors.tab_bar = {
		background = color01,
		active_tab = {
			bg_color = color01,
			fg_color = color03,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = color01,
			fg_color = color02,
		},
		inactive_tab_hover = {
			bg_color = color01,
			fg_color = color02,
			italic = true,
		},
		new_tab = {
			bg_color = color01,
			fg_color = color02,
		},
		new_tab_hover = {
			bg_color = color01,
			fg_color = color02,
			italic = true,
		},
	}
	wezterm.on("update-right-status", function(window, _)
		local time = wezterm.strftime("%a %Y-%m-%d %H:%M")
		local workspace = window:active_workspace()

		window:set_right_status(wezterm.format({
			{ Foreground = { Color = color02 } },
			{ Background = { Color = color01 } },
			{ Text = "  [" .. workspace .. "]  |  " .. time .. "  " },
		}))
	end)
end

return M
