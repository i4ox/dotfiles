local icons = require "icons"

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local function macro_recording_status()
  local function current_status()
    local register = vim.fn.reg_recording()
    return register == "" and "" or "RECORDING @" .. register
  end
  return { "macro-recording", fmt = current_status }
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local components = {
  branch = {
    "b:gitsigns_head",
    icon = icons.git.Branch,
    color = { gui = "bold" },
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = {
      added = icons.git.LineAdded .. " ",
      modified = icons.git.LineModified .. " ",
      removed = icons.git.LineRemoved .. " ",
    },
    padding = { left = 2, right = 1 },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
    },
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = icons.diagnostics.BoldError .. " ",
      warn = icons.diagnostics.BoldWarning .. " ",
      info = icons.diagnostics.BoldInformation .. " ",
      hint = icons.diagnostics.BoldHint .. " ",
    },
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_clients { bufnr = 0 }
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local bufnr = vim.fn.bufnr()
      local buf_client_names = {}
      local codeium_ok, _ = pcall(require, "codeium")

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- add formatter
      local formatters = require("conform").list_formatters(bufnr)
      local supported_formatters = {}
      for _, formatter in pairs(formatters) do
        table.insert(supported_formatters, formatter.name)
      end
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local linters = require("lint").get_running()
      vim.list_extend(buf_client_names, linters)

      local unique_client_names = table.concat(buf_client_names, ", ")
      local language_servers = string.format("[%s]", unique_client_names)

      if codeium_ok then
        language_servers = language_servers .. " " .. icons.git.Octoface
      end

      return language_servers
    end,
    color = { gui = "bold" },
  },
  location = { "location" },
  progress = {
    "progress",
    fmt = function()
      return "%P/%L"
    end,
    color = {},
  },
  spaces = {
    function()
      local space =
        vim.api.nvim_get_option_value(string.format "shiftwidth", { buf = 0 })
      return icons.ui.Tab .. " " .. space
    end,
    padding = 1,
  },
  filetype = {
    "filetype",
    padding = { left = 1, right = 1 },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup {
      options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disable_filetypes = { "alpha" },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          "mode",
          macro_recording_status(),
          components.branch,
        },
        lualine_c = { components.diff },
        lualine_x = {
          components.diagnostics,
          components.lsp,
          components.spaces,
          components.filetype,
        },
        lualine_y = { components.location, components.progress },
        lualine_z = {},
      },
    }

    require("transparent").clear_prefix "lualine"
  end,
}
