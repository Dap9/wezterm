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

config.window_decorations = "RESIZE"

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()

  -- local process_name = pane.foreground_process_name
  -- tab:set_title(process_name or "nu")
end)

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

return config
