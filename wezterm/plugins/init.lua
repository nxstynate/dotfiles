local wezterm = require("wezterm")

local config = wezterm.config_builder and wezterm.config_builder() or {}

require("plugins.shell").apply(config)
require("plugins.options").apply(config)
require("plugins.keys").apply(config)
require("plugins.statusline").apply(config)

return config
