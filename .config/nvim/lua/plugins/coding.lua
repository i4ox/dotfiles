return {
  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    opts = function()
      local cmp = require('cmp')
      local cmp_window = require "cmp.config.window"
      local defaults = require('cmp.config.default')()
      local auto_select = true
      return {
        window = {
          completion = cmp_window.bordered(),
          documentation = cmp_window.bordered(),
        },
        auto_brackets = {},
        completion = {
          completeopt = 'menu,menuone,noinsert' .. (auto_select and '' or ',noselect'),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = auto_select }),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<C-CR>'] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          max_width = 0,
          expandable_indicator = false,
          kind_icons = {
            Array = '',
            Boolean = '',
            Class = '',
            Color = '',
            Constant = '',
            Constructor = '',
            Enum = '',
            EnumMember = '',
            Event = '',
            Field = '',
            File = '',
            Folder = '󰉋',
            Function = '',
            Interface = '',
            Key = '',
            Keyword = '',
            Method = '',
            Module = '',
            Namespace = '',
            Null = '󰟢',
            Number = '',
            Object = '',
            Operator = '',
            Package = '',
            Property = '',
            Reference = '',
            Snippet = '',
            String = '',
            Struct = '',
            Text = '',
            TypeParameter = '',
            Unit = '',
            Value = '',
            Variable = '',
          },
          source_names = {
            nvim_lsp = '(LSP)',
            emoji = '(Emoji)',
            path = '(Path)',
            calc = '(Calc)',
            codeium = '(Codeium)',
            vsnip = '(Snippet)',
            luasnip = '(Snippet)',
            buffer = '(Buffer)',
            tmux = '(TMUX)',
            treesitter = '(TreeSitter)',
          },
          duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          },
          duplicates_default = 0,
          format = function(_, vim_item)
            return vim_item
          end,
        },
        experimental = {
          ghost_text = false
        },
        sorting = defaults.sorting,
      }
    end,
  },
}
