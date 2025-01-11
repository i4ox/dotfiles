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
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local lualine = require("lualine")
      lualine.setup {
        options = {
          theme = "auto",
          icons_enabled = true,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "dashboard", "oil" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = "" }, right_padding = 2 },
          },
          lualine_b = {
            "branch",
            "diff",
            -- "diagnostics",
          },
          lualine_c = { "" },
          lualine_x = { 
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
            {
              require("noice").api.status.command.get,
              cond = require("noice").api.status.command.has,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_y = { "" },
          lualine_z = {
            { "filename", separator = { right = "", left = "" }, left_padding = 2 },
          },
        },
        extensions = { "fzf" },
      }
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
