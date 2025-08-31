-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- changing the font size, type and color scheme.
config.font_size = 12

config.color_scheme = 'Monokai Remastered'
-- config.color_scheme = 'GruvboxDarkHard'

config.font = wezterm.font 'Consolas'

-- Finally, return the configuration to wezterm:
return config
