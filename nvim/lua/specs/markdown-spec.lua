return {
  {
    "tadmccorkle/markdown.nvim",
    ft = { "markdown" },
    opts = true,
  },
  {
    "OXY2DEV/markview.nvim",
    config = function()
      vim.cmd([[highlight MarkviewCode guibg=none]])
      vim.cmd([[highlight MarkviewCodeInfo guibg=none]])
      vim.cmd([[highlight MarkviewIcon1 guibg=none]])
      vim.cmd([[highlight MarkviewIcon2 guibg=none]])
      vim.cmd([[highlight MarkviewIcon3 guibg=none]])
      vim.cmd([[highlight MarkviewIcon4 guibg=none]])
      vim.cmd([[highlight MarkviewIcon5 guibg=none]])
      vim.cmd([[highlight MarkviewIcon6 guibg=none]])

      vim.cmd([[highlight MarkviewHeading1 guifg=#81a1c1 guibg=#3b4252]])
      vim.cmd([[highlight MarkviewHeading2 guifg=#81a1c1 guibg=#3b4252]])
      vim.cmd([[highlight MarkviewHeading3 guifg=#81a1c1 guibg=#3b4252]])
      vim.cmd([[highlight MarkviewHeading4 guifg=#81a1c1 guibg=#3b4252]])
      vim.cmd([[highlight MarkviewHeading5 guifg=#81a1c1 guibg=#3b4252]])
      vim.cmd([[highlight MarkviewHeading6 guifg=#81a1c1 guibg=#3b4252]])

      vim.cmd([[highlight MarkviewHeading1Sign guifg=#81a1c1 guibg=none]])
      vim.cmd([[highlight MarkviewHeading2Sign guifg=#81a1c1 guibg=none]])
      vim.cmd([[highlight MarkviewHeading3Sign guifg=#81a1c1 guibg=none]])
      vim.cmd([[highlight MarkviewHeading4Sign guifg=#81a1c1 guibg=none]])
      vim.cmd([[highlight MarkviewHeading5Sign guifg=#81a1c1 guibg=none]])
      vim.cmd([[highlight MarkviewHeading6Sign guifg=#81a1c1 guibg=none]])

    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    build = "cd app && npm install",
  },
}
