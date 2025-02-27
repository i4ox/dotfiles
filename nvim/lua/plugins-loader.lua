-- Bootstrap lazy.nvim
local plugin_dir = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugin_dir .. "/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup {
  spec = {
    require("specs.requirements-spec"),
    require("specs.navigation-spec"),
    require("specs.colorschemes-spec"),
    require("specs.ui-spec"),
    require("specs.editor-spec"),
    require("specs.lsp-spec"),
    require("specs.markdown-spec"),
    require("specs.database-spec"),
    require("specs.integrations-spec"),
  },
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
  defaults = {
    lazy = false,
    version = false,
  },
}
