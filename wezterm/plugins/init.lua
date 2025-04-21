local wezterm = require("wezterm")
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- require("plugins.background").apply(config)
-- require("plugins.theme").apply(config)
-- require("plugins.statusline").apply(config)
-- require("plugins.theme_custom").apply(config)
require("plugins.shell").apply(config)
require("plugins.theme_solarized_osaka").apply(config)
require("plugins.options").apply(config)
require("plugins.keys").apply(config)

return config
