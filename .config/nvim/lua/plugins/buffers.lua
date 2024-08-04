return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  config = function()
    require("bufferline").setup {
      options = {
        separator_style = { "", "" },
        indicator = {
          icon = " ",
          style = "icon",
        },
        diagnostics = "nvim_lsp",
        offsets = {
          {
            separator = " ",
            highlight = "NvimTreeNormal",
            filetype = "NvimTree",
            text = "",
            text_align = "center",
          },
        },
      },
    }
    require("keymappings").buffers()
  end,
}
