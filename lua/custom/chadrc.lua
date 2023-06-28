require "custom.vim_opts"
---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'chadracula'}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
