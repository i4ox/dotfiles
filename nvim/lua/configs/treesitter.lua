require("nvim-treesitter.configs").setup {
  ensure_installed = {
    -- [[ Vim stuff ]]
    "lua",
    "luadoc",
    "luap",
    "vim",
    "vimdoc",
  },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { "help" },
  },
}
