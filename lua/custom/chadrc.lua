---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'catppuccin',
  transparency = true,
  hl_override = {
    LineNr = { fg = "light_grey" },
    Comment = { fg = "teal" },
    DiffText = { fg = "black" , bg = "baby_pink" },
    DiffAdd = { fg = "grey_fg2", bg = "vibrant_green" },
    DiffDelete = { fg = "black", bg = "red" },
    DiffChangeDelete = { bg = "yellow" },
    DiffChange = { bg = "blue" },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
