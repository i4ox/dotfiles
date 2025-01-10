local keymap = vim.keymap.set

-- Save key strokes
keymap({ "n", "x" }, ";", ":", { desc = "Save key strokes" })

-- Mappings for work with buffers
keymap("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "Save buffer" })
keymap("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "Quit current window" })
keymap("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "Close the neovim" })
keymap("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", { silent = true, desc = "Delete current buffer" })
keymap("n", [[\D]], function()
  local buf_ids = vim.api.nvim_list_bufs()
  local cur_buf = vim.api.nvim_win_get_buf(0)

  for _, buf_id in pairs(buf_ids) do
    if vim.api.nvim_get_option_value("buflisted", { buf = buf_id }) and buf_id ~= cur_buf then
      vim.api.nvim_buf_delete(buf_id, { force = true })
    end
  end
end, { desc = "Delete other buffers" })

-- Go to start or end of line easier
keymap({ "n", "x" }, "H", "^", { desc = "Go to start of line" })
keymap({ "n", "x" }, "L", "g_", { desc = "Go to end of line" })
keymap("i", "<C-A>", "<HOME>", { desc = "Go to start of line(insert)" })
keymap("i", "<C-E>", "<END>", { desc = "Go to end of line(insert)" })
keymap("c", "<C-A>", "<HOME>", { desc = "Go to start of line(term)" })
keymap("c", "<C-E>", "<END>", { desc = "Go to end of line(term)" })

-- Continuous visual shifting to reselect previous visual area
keymap("x", "<", "<gv", { desc = "Visual shifting to left side" })
keymap("x", ">", ">gv", { desc = "Visual shiftint to right side" })

-- Edit and reload neovim config file quickly
keymap("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", { silent = true, desc = "Open init.lua" })
keymap("n", "<leader>sv", function()
  vim.cmd([[
    update $MYVIMRC
    source $MYVIMRC
  ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-dotnet" })
end, { silent = true, desc = "Reload init.lua" })

-- Always use very magic mode for searching
keymap("n", "/", [[/\v]], { desc = "Searching with very magic mode" })

-- Reselect last pasted area
keymap("n", "<leader>v", "printf('[%s]', getregtype()[0])", { expr = true, desc = "Reselect last pasted area" })

-- Toggle spell checking
keymap("n", "<F11>", "<cmd>set spell!<cr>", { desc = "Toggle spell checking" })
keymap("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "Toggle spell checking" })

-- Copy entire buffer
keymap("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })

-- Move current line up and down
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move current line up" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move current line down" })

-- Insert semicolon in the end
keymap("i", "<A-;>", "<Esc>miA;<Esc>`ii", { desc = "Insert semicolon in the end" })
