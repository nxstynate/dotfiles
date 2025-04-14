local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local theme = require("plugins.theme").current
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local M = {}

function M.apply(config)
	bar.apply_to_config(config)
end
return M
