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
