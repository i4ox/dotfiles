require("nvim-treesitter.configs").setup {
  ensure_installed = {
    -- [[ Vim stuff ]]
    "lua",
    "luadoc",
    "luap",
    "vim",
    "vimdoc",
    -- [[ Markdown stuff ]]
    "markdown",
    "markdown_inline",
    "html",
  },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { "help" },
  },
}
