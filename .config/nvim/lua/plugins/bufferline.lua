return {
  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        indicator = {
          icon = ' ',
          style = 'icon',
        },
        separator_style = { '', '' },
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
      require('config.keys').buffers()
    end,
  }
}
