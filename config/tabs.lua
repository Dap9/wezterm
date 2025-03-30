local wezterm = require("wezterm")

local function tab_title(tab_info, max_width)
  local title = tab_info.tab_title

  if title and #title > 0 then
    return title
  end

  local process_name = tab_info.active_pane.foreground_process_name:match("([^/\\]+)%.exe$")
    or tab_info.active_pane.foreground_process_name:match("([^/\\]+)$")

  if process_name:match("nu") then
    -- wezterm.log_info("Found nu: ", process_name)
    -- wezterm.log_info("Found nu: ", process_name:match("%s*nu%s*"))
    -- wezterm.log_info("CWD: ", tab_info.active_pane.current_working_dir)
    return wezterm.truncate_left(tab_info.active_pane.current_working_dir.file_path, max_width)
  end

  return wezterm.truncate_right(process_name, max_width)

end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local is_zoomed = false

  if tab.active_pane.is_zoomed then
    is_zoomed = true
  end

  local tab_info = {
    tab_title = tab.tab_title,
    active_pane = tab.active_pane,
  }
  local title = tab_title(tab_info, max_width - 2)

  local zoom_icon = is_zoomed and wezterm.nerdfonts.cod_zoom_in or ""

  title = string.format(" %s %s ", title, zoom_icon)

  wezterm.log_info(string.format("Title: %s", title))

  return {
    { Text = title },
  }
end)
