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
    event="BufEnter",
  },
  {
    "tpope/vim-repeat",
    dependencies = {
      "tpope/vim-surround",
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = {"G", "Git", "GBrowse"},
    dependencies = {
      "tpope/vim-rhubarb",
    },
  },
  {
    "tpope/vim-rhubarb",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },
  {
    "szw/vim-maximizer",
    event="BufEnter",
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        -- enhanced_diff_hl = true,
        keymaps = {
          file_panel = {
            { "n", "a", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry" } },
          },
        },
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    enabled=false,
  },
  {
    "ThePrimeagen/harpoon",
    event="BufEnter",
    config = function()
      require("harpoon").setup()
      require("telescope").load_extension("harpoon")
      require("core.utils").load_mappings("harpoon")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ThePrimeagen/harpoon",
      'nvim-telescope/telescope-ui-select.nvim',
    },
  },
  {
    "folke/persistence.nvim",
    lazy = false,
    -- event = "BufReadPre",
    opts = {
      options = { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal" },
    },
    config = function()
      require("persistence").setup()
      require("core.utils").load_mappings("persistence")
    end
  },
  {
    "ldelossa/litee.nvim"
  },
  {
    "ldelossa/gh.nvim",
    cmd = "GHSearchPRs",
    dependencies = {
      "ldelossa/litee.nvim"
    },
    config = function()
      require('litee.lib').setup()
      require('litee.gh').setup(require("custom.configs.gh"))
      require("core.utils").load_mappings("gh")
      local wk = require("which-key")
      wk.register({
          g = {
              name = "+Git",
              h = {
                  name = "+Github",
                  c = {
                      name = "+Commits",
                      c = { "<cmd>GHCloseCommit<cr>", "Close" },
                      e = { "<cmd>GHExpandCommit<cr>", "Expand" },
                      o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
                      p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
                      z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
                  },
                  i = {
                      name = "+Issues",
                      p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
                  },
                  l = {
                      name = "+Litee",
                      t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
                  },
                  r = {
                      name = "+Review",
                      b = { "<cmd>GHStartReview<cr>", "Begin" },
                      c = { "<cmd>GHCloseReview<cr>", "Close" },
                      d = { "<cmd>GHDeleteReview<cr>", "Delete" },
                      e = { "<cmd>GHExpandReview<cr>", "Expand" },
                      s = { "<cmd>GHSubmitReview<cr>", "Submit" },
                      z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
                  },
                  p = {
                      name = "+Pull Request",
                      c = { "<cmd>GHClosePR<cr>", "Close" },
                      d = { "<cmd>GHPRDetails<cr>", "Details" },
                      e = { "<cmd>GHExpandPR<cr>", "Expand" },
                      o = { "<cmd>GHOpenPR<cr>", "Open" },
                      p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
                      r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
                      t = { "<cmd>GHOpenToPR<cr>", "Open To" },
                      z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
                  },
                  t = {
                      name = "+Threads",
                      c = { "<cmd>GHCreateThread<cr>", "Create" },
                      n = { "<cmd>GHNextThread<cr>", "Next" },
                      t = { "<cmd>GHToggleThread<cr>", "Toggle" },
                  },
              },
          },
      }, { prefix = "<leader>" })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
}
return plugins
