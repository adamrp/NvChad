-- remove all occurrences of mason/bin from the path (it will be loaded by the plugin's setup function)
local p = "(.-/mason/bin):?"
--local _, count = string.gsub(vim.env.PATH, p, "")
--if count > 1 then
vim.env.PATH = string.gsub(vim.env.PATH, p, "")
--end
