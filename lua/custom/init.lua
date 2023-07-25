-- remove all occurrences of mason/bin from the path (it will be loaded by the plugin's setup function)
local p = "(.-/mason/bin):?"
--local _, count = string.gsub(vim.env.PATH, p, "")
--if count > 1 then
vim.env.PATH = string.gsub(vim.env.PATH, p, "")
--end

local autocmd = vim.api.nvim_create_autocmd

autocmd("WinEnter", {
  callback = function()
    vim.opt_local.winhighlight = ""
  end
})

autocmd("BufEnter", {
  callback = function()
    vim.opt_local.winhighlight = ""
  end
})

local grayout = function()
  vim.cmd [[
    hi MyNormalNC guibg=#0a0a0a guifg=#555555
    ]]
  local settings = {}
  for group, _ in pairs(vim.api.nvim_get_hl(0, {})) do
    table.insert(settings, group .. ":MyNormalNC")
  end
  vim.opt_local.winhighlight = table.concat(settings, ",")
  if vim.bo.filetype == "NvimTree" then
    vim.cmd "q"
  end
end

autocmd("WinLeave", {
  callback = grayout,
})

-- autocmd("TermOpen", {
--   callback = function()
--     --local command = 'call chansend(' .. vim.b.terminal_job_id .. ', "tmux new-window\r")'
--     local command = 'call chansend(' .. vim.b.terminal_job_id .. ', ["tmux new -s vim", ""])'
--     vim.cmd(command)
--   end,
-- })
