local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		{ mods = "LEADER", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ mods = "LEADER", key = "x", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
		{ mods = "LEADER", key = "p", action = wezterm.action.ActivateTabRelative(-1) },
		{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },
		{ mods = "LEADER", key = "-", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "=", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
		{ mods = "LEADER", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
		{ mods = "LEADER", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
		{ mods = "LEADER", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
		{ mods = "LEADER", key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ mods = "LEADER", key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ mods = "LEADER", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
		{ mods = "LEADER", key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ mods = "LEADER", key = "s", action = wezterm.action.ShowLauncher },
		{ mods = "LEADER", key = "t", action = wezterm.action.ShowTabNavigator },
		{ mods = "LEADER", key = "Return", action = wezterm.action.TogglePaneZoomState },
		{ mods = "LEADER", key = "f", action = wezterm.action.ToggleFullScreen },
		{
			mods = "LEADER",
			key = "u",
			action = wezterm.action.SpawnCommandInNewTab({ args = { "wsl.exe", "-d", "Ubuntu" } }),
		},
	}

	-- Add LEADER + number keys for tab switching
	for i = 0, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = wezterm.action.ActivateTab(i),
		})
	end
end

return M
