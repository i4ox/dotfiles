local g = vim.g
local fn = vim.fn

-- [[ Custom variables ]]
g.logging_level = "info"

-- [[ Map leader ]]
g.mapleader = ","
g.maplocalleader = ","

-- [[ Backup ]]
g.backupdir = fn.expand(fn.stdpath("data") .. "/backup//")


-- [[ Plugins ]]
g.loaded_2html_plugin = 1 -- Do not load tohtml.vim
g.loaded_zipPlugin = 1 -- Do not load zipPlugin.vim
g.loaded_gzip = 1 -- Do not load gzip.vim
g.loaded_tarPlugin = 1 -- Do not load tarPlugin.vim
g.loaded_tutor_mode_plugin = 1 -- Do not load the tutor plugin
g.loaded_sql_completion = 1 -- Disable sql omni completion, it is broken
