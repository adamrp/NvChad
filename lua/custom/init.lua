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


-- DETERMINE THE EXECUTABLE TO USE FOR PYTHON HOST PROG.
-- SHOULD BE PYNVIM-SPECIFIC VIRTUAL ENV
vim.g.loaded_python3_provider = nil
-- vim.cmd("runtime python3_provider")
local paths_to_check = {
  "/home/adam/.pyenv/versions/pynvim/bin/python",
}

-- TMK this is _the_ way to iterate over a normal table (list)
-- Don't need the first thing returned by ipairs (the index; == enumerate in python)
for _, path in ipairs(paths_to_check) do
  local test_file = io.open(path, "r")
  if test_file ~= nil then
    io.close(test_file)
    vim.g.python3_host_prog = path
    break
  end
end

autocmd("FileType", {
  pattern = { "DiffviewFiles", "DiffviewFileHistory" },
  callback = function()
    -- SET HIGHLIGHT GROUPS FOR DIFFVIEW
    vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = "#324f3b" } )
    vim.api.nvim_set_hl(0, "DiffviewDiffText", { bg = "#0d3162" } )
    vim.api.nvim_set_hl(0, "DiffviewDiffChange", { bg = "#1E1D2D" } )
    vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#4c0b0b" } )
  end
})

require "custom.vim_opts"
