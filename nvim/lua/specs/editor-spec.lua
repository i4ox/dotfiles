return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    config = function()
      require("configs.treesitter")
    end,
  },
  {
    "iguanacucumber/magazine.nvim", -- not hard fork of nvim-cmp
    name = "nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind-nvim",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "v2.*",
        build = "make install_jsregexp",
      },
    },
    config = function()
      require("configs.cmp")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      local autopairs = require("nvim-autopairs")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      autopairs.setup()
    end,
  },
}
