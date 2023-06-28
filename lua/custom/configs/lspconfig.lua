local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern('.git');
  --extra_paths = {vim.lsp.buf.list_workspace_folders()},
  filetypes = {"python"},
  settings = {
    autoImportCompletions = true,
    python = {
      analysis = {
        diagnosticMode = 'openFilesOnly',
        autoSearchPaths = true,
        typeCheckingMode = 'off',
        -- diagnosticSeverityOverrides = {
        --   reportPrivateImportUsage = "none",
        -- },
      },
    },
  },
})
