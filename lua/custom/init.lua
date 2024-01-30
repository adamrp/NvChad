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

autocmd("FileType", {
  pattern = {"lua", "json", "yaml", "gitconfig", "toml"},
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end
})

require "custom.vim_opts"
