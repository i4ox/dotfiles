return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local devicons = require "nvim-web-devicons"
    devicons.setup {}
    devicons.set_icon {
      lua = {
        icon = "󰀘",
        color = "#61afef",
        name = "lua",
      },
      [".luacheckrc"] = {
        icon = "󰀘",
        color = "#61afef",
        name = "luacheckrc",
      },
      sh = {
        icon = "",
        color = "#70A884",
        name = "sh",
      },
      bat = {
        icon = "",
        color = "#70A884",
        name = "sh",
      },
      yml = {
        icon = "",
        color = "#a074c4",
        name = "yml",
      },
      yaml = {
        icon = "",
        color = "#a074c4",
        name = "yaml",
      },
      dart = {
        icon = "",
        color = "#9CCFD8",
        name = "dart",
      },
      ["g.dart"] = {
        icon = "",
        color = "#EBBCBA",
        name = "gdart",
      },
      ["gr.dart"] = {
        icon = "",
        color = "#EBBCBA",
        name = "gdart",
      },
    }
  end,
}
