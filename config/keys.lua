local wezterm = require("wezterm")

local M = {
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
