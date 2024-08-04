local options = {
  signcolumn = "yes", -- enable column for signs
  number = true, -- enable number for lines
  relativenumber = true, -- relative mod for number options
  scrolloff = 7, -- vertical scroll
  sidescrolloff = 7, -- horizontal scroll
  hlsearch = true, -- highlight when search
  incsearch = true, -- increment when search (x/?)
  tabstop = 2, -- indenting
  softtabstop = 2, -- indenting
  shiftwidth = 2, -- indenting
  expandtab = true, -- indenting
  smartindent = true, -- smart indenting
  ignorecase = true, -- ignore case when search
  smartcase = true, -- smart case when search
  swapfile = false, -- disable swap files
  autoread = true, -- autoread
  clipboard = "unnamedplus", -- clipboard level(system)
  termguicolors = true, -- terminal colors
  laststatus = 3, -- global status
  showmode = false, -- disable show mode
  cursorline = true, -- enable cursor line
  fillchars = { eob = " " }, -- chars
  mouse = "a", -- add mouse support
  ruler = false, -- disable ruler
  numberwidth = 2, -- 2 columns for numbers
  cmdheight = 0, -- hide default cmd line
  splitbelow = true, -- enable split below
  splitright = true, -- enable split right
  timeoutlen = 400, -- time out
  updatetime = 250, -- update time
  undofile = false, -- enable undo files
  wrap = false, -- long lines do not wrapping on new line
  encoding = "utf-8", -- fileformat default
  fileformat = "unix", -- fileformat default
  spell = false, -- disable spelling
  foldmethod = "manual",
  foldenable = false,
}

local globals = {
  mapleader = " ",
  maplocalleader = " ",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

vim.opt.shortmess:append "sI" -- disable NeoVim intro
vim.opt.whichwrap:append "<>[]hl"
