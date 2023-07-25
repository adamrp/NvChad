M = {}

-- adapted from https://github.com/NvChad/nvterm/blob/5ae78fb332e92447121d2af58a6313189a7799fb/README.md
-- M.terminals = {
--   --shell = vim.o.shell,
--   shell = [[
--     tmux ls && tmux attach -t ${sess:-default}
--   ]],
-- }

M.behavior = {
  close_on_exit = true, -- may want to make this false to do some tmux stuff
  auto_insert = false,
}

return M
