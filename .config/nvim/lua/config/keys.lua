local key = vim.keymap.set
local opts = { noremap = true, silent = true }

local M = {}

function M.general()
  -- Increment/decrement
  key('n', '+', '<C-a>')
  key('n', '-', '<C-x>')

  -- Select all
  key('n', '<C-a>', 'gg<S-v>G')

  -- Save file and quit
  key('n', '<Leader>w', ':update<Return>', opts)
  key('n', '<Leader>q', ':quit<Return>', opts)
  key('n', '<Leader>Q', ':qa<Return>', opts)

  -- Split window
  key('n', 'ss', ':split<Return>', opts)
  key('n', 'sv', ':vsplit<Return>', opts)

  -- Move window
  key('n', 'sh', '<C-w>h')
  key('n', 'sk', '<C-w>k')
  key('n', 'sj', '<C-w>j')
  key('n', 'sl', '<C-w>l')

  -- Resize window
  key('n', '<C-S-h>', '<C-w><')
  key('n', '<C-S-l>', '<C-w>>')
  key('n', '<C-S-k>', '<C-w>+')
  key('n', '<C-S-j>', '<C-w>-')

  -- Diagnostics
  key('n', '<C-j>', function()
    vim.diagnostic.goto_next()
  end, opts)
end

function M.neotree()
  key('n', '<Leader>fe', function()
    require('neo-tree.command').execute({
      toggle = true,
      dir = vim.uv.cwd()
    })
  end) -- Open File Tree
  key('n', '<Leader>ge', function()
    require('neo-tree.command').execute({
      source = 'git_status',
      toggle = true,
    })
  end) -- Open Git Tree
  key('n', '<Leader>be', function()
    require('neo-tree.command').execute({
      source = 'buffers',
      toggle = true,
    })
  end) -- Open Buffer Tree
  key('n', '<Leader>e', function()
    require('neo-tree.command').execute({
      toggle = true,
      dir = vim.uv.cwd()
    })
  end) -- Open File Tree
end

function M.buffers()
  key('n', '<Leader>bp', '<Cmd>BufferLineTogglePin<CR>') -- Toggle Pin
  key('n', '<Leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>') -- Delete Non-Pinned Buffers
  key('n', '<Leader>bo', '<Cmd>BufferLineCloseOthers<CR>') -- Delete Other Buffers
  key('n', '<Leader>br', '<Cmd>BufferLineCloseRight<CR>') -- Delete Buffers to the Right
  key('n', '<Leader>bl', '<Cmd>BufferLineCloseLeft<CR>') -- Delete Buffers to the Left
  key('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>') -- Prev Buffer
  key('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>') -- Next Buffer
end

function M.gitsigns()
  local gs = package.loaded.gitsigns
  local function gkey(mode, l, r, desc)
    key(mode, l, r, { buffer = buffer, desc = desc })
  end
  gkey('n', ']h', function()
    if vim.wo.diff then
      vim.cmd.normal({ ']c', bang = true })
    else
      gs.nav_hunk('next')
    end
  end, 'Next Hunk')
  gkey('n', '[h', function()
    if vim.wo.diff then
      vim.cmd.normal({ '[c', bang = true })
    else
      gs.nav_hunk('prev')
    end
  end, 'Prev Hunk')
  gkey('n', ']H', function()
    gs.nav_hunk('last')
  end, 'Last Hunk')
  gkey('n', '[H', function()
    gs.nav_hunk('first')
  end, 'First Hunk')
  gkey({ 'n', 'v' }, '<Leader>ghs', '<Cmd>Gitsigns stage_hunk<CR>', 'Stage Hunk')
  gkey({ 'n', 'v' }, '<Leader>ghr', '<Cmd>Gitsigns reset_hunk<CR>', 'Reset Hunk')
  gkey('n', '<Leader>ghS', gs.stage_buffer, 'Stage Buffer')
  gkey('n', '<Leader>ghR', gs.reset_buffer, 'Reset Buffer')
  gkey('n', '<Leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
  gkey('n', '<Leader>ghp', gs.preview_hunk_inline, 'Preview Hunk Inline')
  gkey('n', '<Leader>ghb', function()
    gs.blame_line({ full = true })
  end, 'Blame Line')
  gkey('n', '<Leader>ghB', function()
    gs.blame()
  end, 'Blame Buffer')
  gkey('n', '<Leader>ghd', gs.diffthis, 'Diff This')
  gkey('n', '<Leader>ghD', function()
    gs.diffthis('~')
  end, 'Diff This ~')
  gkey({ 'o', 'x' }, 'ih', '<Cmd><C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
end

function M.trouble()
  key('n', '<Leader>xx', '<Cmd>Trouble diagnostics toggle<CR>') -- Diagnostics (Trouble)
  key('n', '<Leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>') -- Buffer Diagnostics (Trouble)
  key('n', '<Leader>cs', '<Cmd>Trouble symbols toggle<CR>') -- Symbols (Trouble)
  key('n', '<Leader>cS', '<Cmd>Trouble lsp toggle<CR>') -- LSP references/definitions/... (Trouble)
  key('n', '<Leader>xL', '<Cmd>Trouble loclist toggle<CR>') -- Location List (Trouble)
  key('n', '<Leader>xQ', '<Cmd>Trouble qflist toggle<CR>') -- Quickfix List (Trouble)
  key('n', '[q', function()
    if require('trouble').is_open() then
      require('trouble').prev({ skip_groups = true, jump = true })
    else
      local ok, err = pcall(vim.cmd.cprev)
      if not ok then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end
  end) -- Previous Trouble/Quickfix Item
  key('n', ']q', function()
    if require('trouble').is_open() then
      require('trouble').next({ skip_groups = true, jump = true })
    else
      local ok, err = pcall(vim.cmd.cnext)
      if not ok then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end
  end) -- Next Trouble/Quickfix Item 
end

function M.telescope()
  key('n', '<Leader>sf', '<Cmd>Telescope find_files<CR>') -- Search the Files
  key('n', '<Leader>sw', '<Cmd>Telescope grep_string<CR>') -- Search the Word
  key('n', '<Leader>sg', '<Cmd>Telescope live_grep<CR>') -- Search by Grep
  key('n', '<Leader>sb', '<Cmd>Telescope buffers<CR>') -- Search the Buffers
  key('n', '<Leader>so', '<Cmd>Telescope oldfiles<CR>') -- Search the Oldfiles
  key('n', '<Leader>sh', '<Cmd>Telescope help_tags<CR>') -- Search the Help
end

function M.lsp()
  key('n', '<Leader>gf', '<Cmd>Lspsaga finder<CR>') --  Goto Finder
  key('n', '<Leader>gd', '<Cmd>Lspsaga goto_definition<CR>') --  Goto Definition
  key('n', '<Leader>ca', '<Cmd>Lspsaga code_action<CR>') --  Code Action
  key('n', '<Leader>rn', '<Cmd>Lspsaga rename<CR>') --  Rename
  key('n', '<Leader>K', '<Cmd>Lspsaga hover_doc<CR>') --  Documentation
  key('n', '<Leader>D', '<Cmd>Lspsaga show_line_diagnostics<CR>') --  Diagnostics
end

return M
