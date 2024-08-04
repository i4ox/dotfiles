local M = {}

local function close_tab()
  if vim.api.nvim_buf_get_name(0) ~= "" and vim.o.buftype == "" then
    require("bufdelete").bufdelete(0)
  else
    vim.cmd "quit"
  end
end

function M.global()
  local wk = require "which-key"
  wk.add {
    { ";", "<cmd>Alpha<CR>", desc = "Dashboard" },
    { "w", "<cmd>w!<CR>", desc = "Save" },
    { "q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<C-e>", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
    { "h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  }
end

function M.buffers()
  local wk = require "which-key"
  wk.add {
    { "<leader>q", close_tab, desc = "Close the tab" },
    {
      "<C-h>",
      function()
        vim.cmd "bprev"
      end,
      desc = "Go to the prev tab",
    },
    {
      "<C-l>",
      function()
        vim.cmd "bnext"
      end,
      desc = "Go to the next tab",
    },
  }
end

function M.telescope()
  local wk = require "which-key"
  wk.add {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Search the files",
    },
    {
      "<leader>fw",
      "<cmd>Telescope grep_string<cr>",
      desc = "Search the word",
    },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Search the buffers" },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Open the recent file",
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Search the help tags",
    },
  }
end

function M.lsp()
  local wk = require "which-key"
  wk.add({
    {
      "<leader>gf",
      "<cmd>Lspsaga finder<cr>",
      desc = "Show definitions and references",
    },
    {
      "<leader>gd",
      "<cmd>Lspsaga goto_definition<cr>",
      desc = "Go to definition",
    },
    {
      "<leader>ca",
      "<cmd>Lspsaga code_action<cr>",
      desc = "See available code actions",
    },
    { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Rename the symbol" },
    {
      "<leader>K",
      "<cmd>Lspsaga hover_doc<cr>",
      desc = "Show the documentation",
    },
    {
      "<leader>D",
      "<cmd>Lspsaga show_line_diagnostics<cr>",
      desc = "Show line diagnostics",
    },
  }, { noremap = true, silent = true })
end

function M.comments()
  local wk = require "which-key"
  wk.add {
    {
      mode = { "n" },
      "<leader>/",
      "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
      desc = "Comment the string",
    },

    wk.add {
      {
        mode = { "v" },
        "<leader>/",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Comment the string",
      },
    },
  }
end

function M.dap()
  local wk = require "which-key"
  wk.add {
    {
      "<leader>db",
      "<cmd>DapToggleBreakpoint<cr>",
      desc = "Add breakpoint at line",
    },
    {
      "<leader>dt",
      "<cmd>lua require('dapui').toggle()<cr>",
      desc = "Toogle DAP UI",
    },
    {
      "<leader>dc",
      "<cmd>DapContinue<cr>",
      desc = "Start or continue debugging",
    },
    {
      "<leader>dr",
      "<cmd>lua require('dapui').open({reset = true})<cr>",
      desc = "Reset the DAP UI",
    },
  }
end

function M.git()
  local wk = require "which-key"
  wk.add {
    {
      "<leader>fs",
      "<cmd>Telescope git_status<cr>",
      desc = "Show the git status",
    },
    {
      "<leader>gs",
      "<cmd>lua require('neogit').open()<cr>",
      desc = "Open Neogit",
    },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit with Neogit" },
    { "<leader>gp", "<cmd>Neogit pull", desc = "Pull with Neogit" },
    { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Push with Neogit" },
    {
      "<leader>gb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Telescope show git branches",
    },
  }
end

return M
