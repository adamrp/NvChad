local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint"},
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpf"] = {
      function()
        require("dap-python").test_method()
      end,
      "Debug nearest function above cursor",
    },
    ["<leader>dpF"] = {
      function()
        require("dap-python").test_method({test_runner = "unittest_all"})
      end,
      "Debug all functions matching nearest above cursor",
    },
    ["<leader>dpc"] = {
      function()
        require("dap-python").test_class()
      end,
      "Debug nearest class above cursor",
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
      end,
      "Toggle UI",
    },
  },
}

M.arp = {
  n = {
    ["<C-d>"] = {"M<C-d>zz", "Page down and center"},
    ["<C-u>"] = {"M<C-u>zz", "Page up and center"},
    ["J"] = {"mzJ`z", "Join next line & keep cursor in place"},
    ["n"] = {"nzzzv", "Go to next match and center"},
    ["N"] = {"Nzzzv", "Go to prev match and center"},
    ["<leader>sv"] = {"<C-w>v", "Split window vertically"},
    ["<leader>sh"] = {"<C-w>s", "Split window horizontally"},
    ["<leader>sx"] = {"<cmd> close <CR>", "Close current split window"},
    ["<leader>sm"] = {"<cmd> MaximizerToggle <CR>", "Toggle Pane Maximization"},

    ["<C-h>"] = {"<cmd> TmuxNavigateLeft <CR>", "Navigate window left"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown <CR>", "Navigate window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp <CR>", "Navigate window up"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight <CR>", "Navigate window right"},

    ["<leader>l"] = {"<cmd> set hlsearch! <CR>", "Toggle search highlighting"},
    ["<leader>d"] = {[["_d]], "Delete > black hole"},
    ["<leader>c"] = {[["_c]], "Change > black hole"},

    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["gb"] = { "<cmd> GBrowse <CR>", "GBrowse" },
  },
  v = {
    ["<C-j>"] = {":m '>+1<CR>gv=gv", "Move selection down"},
    ["<C-k>"] = {":m '<-2<CR>gv=gv", "Move selection up"},
    ["<leader>d"] = {[["_d]], "Delete > black hole"},
    ["<leader>c"] = {[["_c]], "Change > black hole"},
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["gb"] = { ":'<,'>GBrowse<CR>", "GBrowse" },
  },
}
return M
