return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require "telescope"
    telescope.setup {
      defaults = {
        dynamic_preview_title = true,
        path_display = { "smart" },
        prompt_prefix = require("icons").ui.Telescope .. " ",
        selection_caret = require("icons").ui.Forward .. " ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    }

    telescope.load_extension "ui-select"
    telescope.load_extension "fzf"

    require("keymappings").telescope()
  end,
}
