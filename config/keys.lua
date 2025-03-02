local wezterm = require("wezterm")

local M = {
  -- Pane splitting
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.SplitPane({
      direction = "Right",
    }),
  },
  {
    key = "v",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Left",
    }),
  },

  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.SplitPane({
      direction = "Down",
    }),
  },
  {
    key = "s",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Up",
    }),
  },

  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },

  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  }
}

return M
