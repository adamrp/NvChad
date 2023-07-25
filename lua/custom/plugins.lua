local plugins = {
  {
    "williamboman/mason.nvim",
    lazy=false,
    opts = {
      PATH="append",
      ensure_installed = {
        "pyright",
        "lua-language-server",
        "mypy",
        "isort",
        "flake8",
        "cfn-lint",
        "black",
        "debugpy",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy=false,
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.float_element("console", {width=160, height=40})
      -- end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.float_element("console", {width=160, height=40})
      end
      require("core.utils").load_mappings("dapui")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = {"python"},
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "custom.configs.nvim-dap-python"
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "NvChad/nvterm",
    opts = require "custom.configs.nvterm",
  },
  {
    "tpope/vim-surround",
    lazy=false,
  },
  {
    "tpope/vim-repeat",
    dependencies = {
      "tpope/vim-surround",
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },
}
return plugins
