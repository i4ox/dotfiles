return {
  "NeogitOrg/neogit",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    require("gitsigns").setup {}
    require("neogit").setup {}

    require("keymappings").git()
  end,
}
