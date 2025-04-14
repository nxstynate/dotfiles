local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	local os_name = wezterm.target_triple

	if os_name:find("windows") then
		-- Pick one manually; change to "powershell.exe" if needed
		config.default_prog = { "pwsh.exe", "-NoLogo" }
	else
		-- On Unix-based systems
		config.default_prog = { "/bin/zsh", "-l" }
	end
end

return M
