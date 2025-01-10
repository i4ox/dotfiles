local g = vim.g
local fn = vim.fn

local utils = require("utils")

-- [[ Custom variables ]]
g.logging_level = "info"

g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
g.is_mac = utils.has("macunix") or true and false

-- [[ Map leader ]]
g.mapleader = ","
g.maplocalleader = ","

-- [[ Backup ]]
g.backupdir = fn.expand(fn.stdpath("data") .. "/backup//")

-- [[ Providers ]]
g.loaded_perl_provider = 0 -- Disable perl provider
g.loaded_ruby_provider = 0 -- Disable ruby provider
g.loaded_node_provider = 0 -- Disable node provider

if utils.executable("python3") then
  if g.is_win then
    g.python3_host_prog = fn.substitute(fn.exepath("python3"), ".exe$", "", "g")
  else
    g.python3_host_prog = fn.exepath("python3")
  end
else
  vim.api.nvim_err_writeln("Python3 executable not found! You must install Python3 and set its PATH correctly!")
  return
end

-- [[ Plugins ]]
g.loaded_2html_plugin = 1 -- Do not load tohtml.vim
g.loaded_zipPlugin = 1 -- Do not load zipPlugin.vim
g.loaded_gzip = 1 -- Do not load gzip.vim
g.loaded_tarPlugin = 1 -- Do not load tarPlugin.vim
g.loaded_tutor_mode_plugin = 1 -- Do not load the tutor plugin
g.loaded_sql_completion = 1 -- Disable sql omni completion, it is broken
g.did_install_default_menus = 1 -- Do not load default menu

