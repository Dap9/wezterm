local wezterm = require("wezterm")

---@module "wezterm"
---@class wezterm.ConfigBuilder
local config = wezterm.config_builder()

config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Catppuccin Mocha"

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

-- Only do below if on windows
-- config.default_prog = { "nu" }

-- Install from https://www.nerdfonts.com/font-downloads
-- config.font = wezterm.font("Terminess Nerd Font Mono")
config.font = wezterm.font("ShureTechMono Nerd Font Mono")
config.font_size = 9.75

config.leader = { key = "Space", mods = "CTRL" }
config.keys = require("config.keys")

-- config.window_decorations = "RESIZE"

-- wezterm.on("gui-startup", function(cmd)
--   local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
--   -- window:gui_window():maximize()
--
--   -- local process_name = pane.foreground_process_name
--   -- tab:set_title(process_name or "nu")
-- end)

local function get_process(tab)
  local process_name = tab.active_pane.foreground_process_name:match("([^/\\]+)%.exe$")
    or tab.active_pane.foreground_process_name:match("([^/\\]+)$")

  -- local icon = process_icons[process_name] or string.format('[%s]', process_name)
  local icon = process_icons[process_name] or wezterm.nerdfonts.seti_checkbox_unchecked

  return icon
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local has_unseen_output = false
  local is_zoomed = false

  for _, pane in tab.panes do
    if not tab.is_active and pan.has_unseen_output then
      has_unseen_output = true
    end

    if pane.is_zoomed then
      is_zoomed = true
    end
  end

  local process_name = get_process(tab)
  local zoom_icon = is_zoomed and wezterm.nerdfonts.cod_zoom_in or ""

  local title = string.format(" %s ~ %s ", process_name, zoom_icon)

  return wezterm.font({
    { Text = title },
  })
end)

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
-- you can put the rest of your Wezterm config here
smart_splits.apply_to_config(config, {
  -- the default config is here, if you'd like to use the default keys,
  -- you can omit this configuration table parameter and just use
  -- smart_splits.apply_to_config(config)

  -- directional keys to use in order of: left, down, up, right
  direction_keys = { "h", "j", "k", "l" },
  -- if you want to use separate direction keys for move vs. resize, you
  -- can also do this:
  -- direction_keys = {
  --   move = { "h", "j", "k", "l" },
  --   resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
  -- },
  -- modifier keys to combine with direction_keys
  modifiers = {
    move = "META", -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = "CTRL|SHIFT", -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
  -- log level to use: info, warn, error
  log_level = "info",
})

return config
