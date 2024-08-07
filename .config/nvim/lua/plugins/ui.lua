return {
  {
    'MunifTanjim/nui.nvim',
    lazy = true,
  },
  {
    'folke/noice.nvim',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'mgs_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    config = function(_, opts)
      if vim.o.filetype == 'lazy' then
        vim.cmd [[messages clear]]
      end
      require('noice').setup(opts)
    end,
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      stages = 'static',
      timeout = 2000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      vim.notify = require('notify')
    end,
  },
  {
    -- instead `nvim-web-devicons`
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    enabled = false,
    lazy = false,
    opts = function()
      local logo = [[
  (`\ .-') /`   ('-. .-. .-')  _ .-') _     ('-.        (`-.   
   `.( OO ),' _(  OO)\  ( OO )( (  OO) )  _(  OO)     _(OO  )_ 
,--./  .--.  (,------.;-----.\ \     .'_ (,------.,--(_/   ,. \
|      |  |   |  .---'| .-.  | ,`'--..._) |  .---'\   \   /(__/
|  |   |  |,  |  |    | '-' /_)|  |  \  ' |  |     \   \ /   / 
|  |.'.|  |_)(|  '--. | .-. `. |  |   ' |(|  '--.   \   '   /, 
|         |   |  .--' | |  \  ||  |   / : |  .--'    \     /__)
|   ,'.   |   |  `---.| '--'  /|  '--'  / |  `---.    \   /    
'--'   '--'   `------'`------' `-------'  `------'     `-'     
      ]]
      local opts = {
        theme = 'doom',
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = ' %s'
      end

      if vim.o.filetype == 'lazy' then
        vim.api.nvim_create_autocmd('WinClosed', {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
            end)
          end,
        })
      end

      return opts
    end,
  }
}
