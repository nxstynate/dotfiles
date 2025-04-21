local M = {}

function M.apply(config)
	config.window_background_image = "./images/background.jpg" -- Update to your image path

	-- Optional tweaks for appearance
	config.window_background_image_hsb = {
		brightness = 0.1, -- 0 = black, 1 = full brightness
		hue = 1.0,
		saturation = 1.0,
	}
end

return M
