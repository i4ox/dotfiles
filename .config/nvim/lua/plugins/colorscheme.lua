return {
  {
    --'sainnhe/sonokai',
    'projekt0n/github-nvim-theme',
    priority = 1000,
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
      },
    },
    config = function(_, opts)
      require('github-theme').setup(opts)
      vim.cmd.colorscheme('github_dark_dimmed')
    end,
  },
  {
    'xiyaowong/nvim-transparent',
    lazy = false,
    opts = {
      groups = {
        'Normal',
        'NormalNC',
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'SignColumn',
        'CursorLine',
        'CursorLineNr',
        'EndOfBuffer',
      },
      extra_groups = {
        'NormalFloat',
      },
      exclude_groups = {},
    },
    config = function(_, opts)
      vim.cmd 'highlight TelescopeBorder guifg=#6cb6ff guibg=none'
      vim.cmd 'highlight TelescopePromptBorder guifg=#6cb6ff guibg=none'
      vim.cmd 'highlight TelescopeResultsBorder guifg=#6cb6ff guibg=none'
      vim.cmd 'highlight TelescopePreviewBorder guifg=#6cb6ff guibg=none'
      vim.cmd 'highlight FloatBorder guifg=#6cb6ff guibg=none'
      require('transparent').setup(opts)
    end,
  },
}
