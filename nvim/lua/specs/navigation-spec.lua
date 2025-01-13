return {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      view_options = {
        show_hidden = true,
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        spell = false,
        list = false,
      },
      keymaps = {
        ["-"] = "actions.parent",
        ["+"] = "actions.select",
        ["<CR>"] = "actions.select",
        ["g?"] = "actions.show_help",
        ["<C-h>"] = "actions.toggle_hidden",
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup {}

      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")
      telescope.load_extension("yaml_schema")
    end,
  },
}
