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
        "yamllint",
        "gopls",
        "golangci-lint",
        "golangci-lint-langserver",
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
  { "nvim-neotest/nvim-nio" },
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
    dependencies = "nvim-neotest/nvim-nio",
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
    cmd = {"DiffviewOpen", "DiffviewFileHistory"},
    config = function()
      require("diffview").setup(require("custom.configs.diffview_config"))
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
      "ThePrimeagen/refactoring.nvim",
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
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "junegunn/fzf",
    build = "./install --bin",
    dependencies = { "ibhagwan/fzf-lua" },
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = "qf",
    dependencies = { "junegunn/fzf" },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require('treesitter-context').setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, special = "gray" } )
    end,
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow" },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = true
      vim.g.undotree_DiffCommand = "diff"
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      local opts = require("plugins.configs.cmp")
      opts.mapping["<CR>"] = nil
      opts.mapping["<C-f>"] = nil
      opts.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)
      opts.mapping["<C-u>"] = cmp.mapping.scroll_docs(-4)
      opts.mapping["<C-Enter>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('refactoring').setup({
        prompt_func_return_type = {
          go = true,
          java = false,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        prompt_func_param_type = {
          go = true,
          java = false,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        printf_statements = {},
        print_var_statements = {
          python = {
            "print(f'custom print_var %s {str(%s)}')",
          },
        },
        show_success_message = false, -- shows a message with information about the refactor on success
        -- i.e. [Refactor] Inlined 3 variable occurrences
        extract_var_statements = {
          go = "%s := %s // poggers"
        },
      })

      -- load refactoring Telescope extension
      require("telescope").load_extension("refactoring")
      require("core.utils").load_mappings("refactoring")
    end,
  },
}
return plugins
