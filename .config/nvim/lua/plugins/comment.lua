return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
    require("keymappings").comments()
  end,
}
