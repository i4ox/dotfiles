return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local formatters = {
      lua = { "stylua" },
    }

    require("conform").setup {
      formatters_by_ft = formatters,
      format_on_save = {
        pattern = ".lua", -- split with , like ".lua,.py,.go"
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    }
  end,
}
