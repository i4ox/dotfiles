return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        options = {
          transparency = true,
          terminal_colors = true,
        },
      }
      vim.cmd([[colorscheme onedark]])
    end,
  },
}
