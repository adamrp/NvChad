local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"},
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpf"] = {
      function()
        require("dap-python").test_method()
      end
    },
    ["<leader>dpF"] = {
      function()
        require("dap-python").test_method({test_runner = "unittest_all"})
      end
    },
    ["<leader>dpc"] = {
      function()
        require("dap-python").test_class()
      end
    },
  },
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>dbu"] = {
      function()
        local dapui = require("dapui")
        dapui.toggle()
      end
    },
  },
}

M.arp = {
  n = {
    ["<C-d>"] = {"M<C-d>zz"},
    ["<C-u>"] = {"M<C-u>zz"},
    ["J"] = {"mzJ`z"},
    ["n"] = {"nzzzv"},
    ["N"] = {"Nzzzv"},
  },
  v = {
    ["<C-j>"] = {":m '>+1<CR>gv=gv"},
    ["<C-k>"] = {":m '<-2<CR>gv=gv"},
  },
}
return M
