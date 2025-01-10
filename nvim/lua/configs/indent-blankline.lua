local api = vim.api

local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "dashboard" }

require("ibl").setup {
  indent = {
    char = "┋",
  },
  scope = {
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = exclude_ft,
  },
}

-- Enable and disable indent blanklines when leave and enter to insert mode
local indent_blankline_group = api.nvim_create_augroup("indent_blankline", { clear = true })
api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = indent_blankline_group,
  command = "IBLDisable",
})

api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = indent_blankline_group,
  callback = function()
    if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
      vim.cmd([[IBLEnable]])
    end
  end,
})
