return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "b0o/schemastore.nvim",
    "SmiteshP/nvim-navic",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    local lspconfig = require "lspconfig"
    local servers = {
      -- Yaml
      ["yaml-language-server"] = function()
        lspconfig["yamlls"].setup {
          capabilities = capabilities,
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        }
      end,
      -- Json
      ["json-lsp"] = function()
        lspconfig["jsonls"].setup {
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        }
      end,
      -- Lua
      ["lua-language-server"] = function()
        require("neodev").setup {}
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        }
      end,
    }

    lspconfig["dartls"].setup {
      cmd = { "fvm", "dart", "language-server", "--protocol=lsp" },
      capabilities = capabilities,
      filetypes = { "dart" },
    }

    local mason_registry = require "mason-registry"
    for mason_server_name, setup_fn in pairs(servers) do
      if not mason_registry.is_installed(mason_server_name) then
        vim.cmd("MasonInstall " .. mason_server_name)
      end
      setup_fn()
    end
  end,
}
