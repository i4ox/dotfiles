vim.scriptencoding = 'utf-8'
vim.opt.path:append({ '**' })

local options = {
	encoding = 'utf-8',
  fileencoding = 'utf-8',
  number = true,
  title = true,
  autoindent = true,
  smartindent = true,
  backup = false,
	showcmd = true,
	cmdheight = 0,
	laststatus = 0,
	expandtab = true,
	scrolloff = 10,
	inccommand = 'split',
	ignorecase = true,
	smarttab = true,
	breakindent = true,
  shiftwidth = 2,
  tabstop = 2,
	wrap = true,
	backspace = { 'start', 'eol', 'indent' },
	splitbelow = true,
	splitright = true,
	splitkeep = 'cursor',
	mouse = '',
}

local globals = {
  mapleader = ' ',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
