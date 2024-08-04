return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("lspsaga").setup {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false, -- disable breadcrumbs
      },
      diagnostic = {
        on_insert = false,
      },
      definition = {
        edit = "<CR>",
      },
    }

    local icons = require "icons"
    local signs = {
      Error = icons.diagnostics.BoldError,
      Warn = icons.diagnostics.BoldWarning,
      Hint = icons.diagnostics.BoldHint,
      Info = icons.diagnostics.BoldInformation,
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    require("keymappings").lsp()
    require("transparent").clear_prefix "Lsp"
  end,
}
