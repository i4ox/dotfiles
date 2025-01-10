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

      vim.cmd([[highlight MarkviewHeading1 guifg=#e06c75 guibg=#4e2c2f]]) -- Красный
      vim.cmd([[highlight MarkviewHeading2 guifg=#d19a66 guibg=#4e412e]]) -- Оранжевый
      vim.cmd([[highlight MarkviewHeading3 guifg=#e5c07b guibg=#4e4a2e]]) -- Желтый
      vim.cmd([[highlight MarkviewHeading4 guifg=#98c379 guibg=#2e3d2d]]) -- Зеленый
      vim.cmd([[highlight MarkviewHeading5 guifg=#61afef guibg=#2d394f]]) -- Синий
      vim.cmd([[highlight MarkviewHeading6 guifg=#56b6c2 guibg=#2d3d3e]]) -- Бирюзовы

      vim.cmd([[highlight MarkviewHeading1Sign guifg=#e06c75 guibg=none]]) -- Красный
      vim.cmd([[highlight MarkviewHeading2Sign guifg=#d19a66 guibg=none]]) -- Оранжевый
      vim.cmd([[highlight MarkviewHeading3Sign guifg=#e5c07b guibg=none]]) -- Желтый
      vim.cmd([[highlight MarkviewHeading4Sign guifg=#98c379 guibg=none]]) -- Зеленый
      vim.cmd([[highlight MarkviewHeading5Sign guifg=#61afef guibg=none]]) -- Синий
      vim.cmd([[highlight MarkviewHeading6Sign guifg=#56b6c2 guibg=none]]) -- Бирюзовый
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
