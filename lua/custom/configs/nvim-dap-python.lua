local debugpy_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
local dap_python = require("dap-python")

-- copy-paste from https://github.com/mfussenegger/nvim-dap-python/blob/37b4cba02e337a95cb62ad1609b3d1dccb2e5d42/lua/dap-python.lua#L41-L43
local function prune_nil(items)
  return vim.tbl_filter(function(x) return x end, items)
end

-- adapted from https://github.com/mfussenegger/nvim-dap-python/blob/37b4cba02e337a95cb62ad1609b3d1dccb2e5d42/lua/dap-python.lua#L109-L115
function dap_python.test_runners.unittest_all(classname, methodname)
  -- took this line from https://github.com/mfussenegger/nvim-dap-python/blob/37b4cba02e337a95cb62ad1609b3d1dccb2e5d42/lua/dap-python.lua#L105
  local path = vim.fn.expand('%:.:r:gs?/?.?')
  local test_path = table.concat(prune_nil({path, classname, methodname}), '.')
  local args = {'discover', '-k', test_path .. "*"}
  return 'unittest', args
end

dap_python.setup(debugpy_path)
