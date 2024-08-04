return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },
  config = function()
    local icons = require "icons"
    require("mason").setup {
      ui = {
        border = "rounded",
        icons = {
          package_pending = icons.misc.MasonPackagePending,
          package_installed = icons.misc.MasonPackageInstalled,
          package_uninstalled = icons.misc.MasonPackageUninstalled,
        },
      },
    }
    require("mason-lspconfig").setup {}
    require("mason-tool-installer").setup {
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "yaml-language-server",
        "json-lsp",
        -- Linters
        "luacheck",
        -- Formatters
        "stylua",
        -- Daps
      },
    }
  end,
}
