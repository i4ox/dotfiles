return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup {
        preset = "modern",
        icons = {
          mappings = false,
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.noice")
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.dressing")
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup {
        stages = "fade_in_slide_out",
        timeout = 1500,
        background_colour = "#000000",
      }
      vim.notify = notify
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("bufferline").setup {
        options = {
          mode = "buffers",
          show_buffer_close_icons = false,
          separator_style = { "", "" },
          color_icons = true,
          indicator = {
            style = "none",
          },
        },
      }
    end,
  },
}
