return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "onsails/lspkind.nvim",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
      },
      version = "2.*",
      build = "make install_jsregexp",
    },
    -- sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "andersevenrud/cmp-tmux",
  },
  config = function()
    local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
    if not status_cmp_ok then
      return
    end

    local ConfirmBehavior = cmp_types.ConfirmBehavior

    local cmp = require "cmp"
    local cmp_window = require "cmp.config.window"
    local cmp_mapping = require "cmp.config.mapping"
    local luasnip = require "luasnip"
    cmp.setup {
      confirm_opts = {
        behavior = ConfirmBehavior.Replace,
        select = false,
      },
      completion = {
        keyword_length = 1,
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        expandable_indicator = false,
        kind_icons = require("icons").kind,
        source_names = {
          nvim_lsp = "(LSP)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          codeium = "(Codeium)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
          tmux = "(TMUX)",
          treesitter = "(TreeSitter)",
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
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp_window.bordered(),
        documentation = cmp_window.bordered(),
      },
      sources = {
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            local kind =
              require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
              return false
            end
            return true
          end,
        },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "calc" },
        { name = "codeium" },
        { name = "emoji" },
        { name = "treesitter" },
        { name = "tmux" },
      },
      mapping = cmp_mapping.preset.insert {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(
                "<Plug>luasnip-expand-or-jump",
                true,
                true,
                true
              ),
              ""
            )
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(
                "<Plug>luasnip-jump-prev",
                true,
                true,
                true
              ),
              ""
            )
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
    }
  end,
}
