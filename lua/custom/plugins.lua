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
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
