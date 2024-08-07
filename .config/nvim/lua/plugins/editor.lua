return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    opts = {
      headerMaxWidth = 80,
    },
    keys = {
      {
        '<Leader>sr',
        function()
          local grug = require('grug-far')
          local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
          grug.grug_far({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          })
        end,
        mode = { 'n', 'v' },
        desc = 'Search and Replace',
      },
    },
  },
  {
    'folke/trouble.nvim',
    opts = {
      modes = {
        lsp = {
          win = { position = 'right' },
        },
      },
    },
    config = function(_, opts)
      require('trouble').setup(opts)
      require('config.keys').trouble()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
}
