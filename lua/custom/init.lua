-- remove all occurrences of mason/bin from the path (it will be loaded by the plugin's setup function)
local p = "(.-/mason/bin):?"
vim.env.PATH = string.gsub(vim.env.PATH, p, "")

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.colorcolumn = "110"
  end
})

require "custom.vim_opts"
