-- remove all occurrences of mason/bin from the path (it will be loaded by the plugin's setup function)
local p = "(.-/mason/bin):?"
vim.env.PATH = string.gsub(vim.env.PATH, p, "")

local autocmd = vim.api.nvim_create_autocmd

-- do not need first argument (buffer number)
require("editorconfig").properties.colorcolumn = function(_, val)
  vim.opt.colorcolumn = val
end

autocmd("FileType", {
  pattern = "python",
  callback = function(opts)
    vim.opt.colorcolumn = "110"
    require("editorconfig").config(opts.buf)
  end
})

autocmd("FileType", {
  pattern = {"lua", "json", "yaml", "gitconfig", "toml"},
  callback = function(opts)
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    require("editorconfig").config(opts.buf)
  end
})

require "custom.vim_opts"
