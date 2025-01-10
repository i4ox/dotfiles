local g = vim.g
local fn = vim.fn

-- [[ Custom variables ]]
g.logging_level = "info"

-- [[ Map leader ]]
g.mapleader = ","
g.maplocalleader = ","

-- [[ Backup ]]
g.backupdir = fn.expand(fn.stdpath("data") .. "/backup//")
