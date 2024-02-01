---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'catppuccin',
  transparency = true,
  hl_override = {
    LineNr = { fg = "light_grey" },
    Comment = { fg = "#94d4ed" },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
