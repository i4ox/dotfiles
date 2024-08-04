return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "comment",
        "lua",
        -- front
        "javascript",
        "typescript",
        "tsx",
        "jsdoc",
        "json",
        "html",
        "css",
        "scss",
        "vue",
        "svelte",
        -- configs
        "yaml",
        -- docs
        "markdown",
        "markdown_inline",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<enter>",
          node_incremental = "<enter>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
}
