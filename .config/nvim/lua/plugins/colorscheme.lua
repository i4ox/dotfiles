return {
  "folke/tokyonight.nvim",
  priority = 1000,
  dependencies = {
    "xiyaowong/nvim-transparent",
  },
  config = function()
    vim.cmd [[colorscheme tokyonight-night]]
    require("transparent").setup {
      groups = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "EndOfBuffer",
      },
      extra_groups = {
        "NormalFloat",
      },
      exclude_groups = {},
    }

    vim.cmd "highlight TelescopeBorder guifg=#DB635D guibg=none"
    vim.cmd "highlight TelescopePromptBorder guifg=#DB635D guibg=none"
    vim.cmd "highlight TelescopeResultsBorder guifg=#DB635D guibg=none"
    vim.cmd "highlight TelescopePreviewBorder guifg=#DB635D guibg=none"
    vim.cmd "highlight FloatBorder guifg=#DB635D guibg=none"

    require("transparent").clear_prefix "NvimTree"

    -- Disable background for native WinBar
    require("transparent").clear_prefix "WinBar"
  end,
}
