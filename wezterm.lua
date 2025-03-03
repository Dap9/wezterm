local wezterm = require("wezterm")

---@module "wezterm"
---@class wezterm.ConfigBuilder
local config = wezterm.config_builder()

config.color_scheme = "tokyonight_night"

config.default_cursor_style = "SteadyBar"

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false

local window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_padding = window_padding

config.default_prog = { "nu" }

-- Install from https://www.nerdfonts.com/font-downloads
-- config.font = wezterm.font("Terminess Nerd Font Mono")
config.font = wezterm.font("ShureTechMono Nerd Font Mono")
config.font_size = 9.75

config.leader = { key = "Space", mods = "CTRL" }
config.keys = require("config.keys")

return config
